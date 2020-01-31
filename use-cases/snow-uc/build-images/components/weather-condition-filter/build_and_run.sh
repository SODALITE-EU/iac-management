cd "${0%/*}" || exit
docker build -t snow-weather-condition-filter .
mkdir -p Builds/
docker save -o Builds/snow-weather-condition-filter.tar snow-weather-condition-filter
docker run -v "$PWD/Builds":/home/snow-weather-condition-filter/build/ -it snow-weather-condition-filter