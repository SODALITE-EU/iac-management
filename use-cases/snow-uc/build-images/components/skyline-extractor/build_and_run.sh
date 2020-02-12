cd "${0%/*}" || exit
docker build -t snow-skyline-extractor .
mkdir -p Builds/
docker save -o Builds/snow-skyline-extractor.tar snow-skyline-extractor
docker run -p 8080:8080 -it snow-skyline-extractor