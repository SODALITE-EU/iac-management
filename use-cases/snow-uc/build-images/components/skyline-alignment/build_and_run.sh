cd "${0%/*}" || exit
docker build -t snow-skyline-alignment .
mkdir -p Builds/
docker save -o Builds/snow-skyline-alignment.tar snow-skyline-alignment
docker run -p 8081:8080 -it snow-skyline-alignment