cd "${0%/*}" || exit
sudo docker build -t snow-snow-mask-computation .
mkdir -p Builds/
sudo docker save -o Builds/snow-snow-mask-computation.tar snow-snow-mask-computation
sudo docker run -p 5000:5000 -v "$PWD/Builds":/home/snow-snow-mask-computation/build/ -it snow-snow-mask-computation
