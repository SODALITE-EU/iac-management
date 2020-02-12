cd "${0%/*}" || exit
docker build -t snow-mysql .
mkdir -p Builds/
docker save -o Builds/snow-mysql.tar snow-mysql
docker run -p 3306:3306 -it snow-mysql