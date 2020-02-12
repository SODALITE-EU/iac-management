cd "${0%/*}" || exit
docker build -t snow-webcam-crawler .
mkdir -p Builds/
docker save -o Builds/snow-webcam-crawler.tar snow-webcam-crawler
docker run -it snow-webcam-crawler