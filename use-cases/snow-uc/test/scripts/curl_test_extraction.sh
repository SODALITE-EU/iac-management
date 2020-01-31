#!/bin/bash

function usage() {
echo "Usage:  $0 path host:port"
echo "Executes skyline-extraction call host:port for every jpg file in path that doesn't contain 'extra'"
echo "Prints out times recorded and calculates the average overall time for skyline-extraction of all executed calls"
echo "Example: $0 . 154.48.185.171:8080";
}

if [ $# -ne 2 ]; then
usage;
exit;
fi

path=$1
host_port=$2

#setup total count = 0
tot=0
i=0

lines=$(find $1 -name '*.jpg' | grep -v extra)

echo "lines=${lines}" 

while read line
do
    filename=$(basename -- "$line")
    dirname=$(dirname -- "$line")
    filename="${filename%.*}"
    #echo "filename=${filename}" 

    #output i in zero paded format 5 -> 0005
    printf -v j "%04d" $i
    res=`curl -w "##${j}: %{time_total}\t\t%{time_namelookup}\t\t%{time_connect}\t\t%{time_appconnect}\t\t%{time_pretransfer}\t\t%{time_redirect}\t\t%{time_starttransfer}\t\t${filename}" -H "Content-Type: multipart/form-data" -F file=@${line} -X POST http://${host_port}/skyline_extraction/process --output ${dirname}/extracted-skyline-${filename}.jpg`
    echo $res
    val=`echo $res | cut -f2 -d' '`
    tot=`echo "scale=3;${tot}+${val}" | bc`
    let i=i+1
done <<< "$lines"

avg=`echo "scale=3; ${tot}/${i}" |bc`
echo "........................."
echo "AVG: $tot/$i = $avg"
