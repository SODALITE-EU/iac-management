cd "${0%/*}" || exit
sudo docker build -t snow-snow-index-computation .
mkdir -p Builds/
sudo docker save -o Builds/snow-snow-index-computation.tar snow-snow-index-computation
sudo docker run -p 5005:5005 -v "$PWD/Builds":/home/snow-snow-index-computation/build/ -it snow-snow-index-computation
