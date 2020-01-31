cd "${0%/*}" || exit
docker build -t snow-mysql .
mkdir -p Builds/
docker save -o Builds/snow-mysql.tar snow-mysql
docker run -p 3306:3306 -v "$PWD/Builds":/home/snow-mysql/build/ -it snow-mysql