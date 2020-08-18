cd "${0%/*}" || exit
sudo docker build -t snow-flicker-crawler .
mkdir -p Builds/
sudo docker save -o Builds/snow-flicker-crawler.tar snow-flicker-crawler
sudo docker run -v "$PWD/Builds":/home/snow-flicker-crawler/build/ -it snow-flicker-crawler
