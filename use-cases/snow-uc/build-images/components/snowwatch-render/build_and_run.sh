cd "${0%/*}" || exit
sudo docker build -t snow-snowwatch-render .
mkdir -p Builds/
sudo docker save -o Builds/snow-snowwatch-render.tar snow-snowwatch-render
sudo docker run -v "$PWD/Builds":/home/snow-snowwatch-render/build/ -it snow-snowwatch-render
