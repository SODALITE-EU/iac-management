FROM ubuntu:kinetic

ARG DEBIAN_FRONTEND=noninteractive

# Get Weather Condition Filter
# clone https://gitlab.com/wds-co/SnowWatch-SODALITE.git and copy this file in SnowWatch-SODALITE dir
COPY WeatherConditionFilter/ SnowWatch-SODALITE/WeatherConditionFilter/
COPY data/masks/ SnowWatch-SODALITE/data/masks/
COPY config.json SnowWatch-SODALITE/config.json

WORKDIR SnowWatch-SODALITE/WeatherConditionFilter/

# Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

#Install Mysql and some packages for openCV
RUN apt-get update && \
    apt-get -y install libsm6 libxext6 libxrender-dev mysql-server && \
    python3 config.py && \
    apt-get clean;

ENTRYPOINT ["python3", "main.py"]
CMD ["2019-12-04", "6666"]


