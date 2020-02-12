cd "${0%/*}" || exit
docker build -t snow-daily-median-aggregator .
mkdir -p Builds/
docker save -o Builds/snow-daily-median-aggregator.tar snow-daily-median-aggregator
docker run -it snow-daily-median-aggregator