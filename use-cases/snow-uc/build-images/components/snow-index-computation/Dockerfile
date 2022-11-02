FROM ubuntu:kinetic-20220830

ARG DEBIAN_FRONTEND=noninteractive

COPY /SnowIndexComputation/service/ SnowWatch-SODALITE/SnowIndexComputation/service/
COPY /config.json SnowWatch-SODALITE/
COPY /data/ SnowWatch-SODALITE/data/

WORKDIR SnowWatch-SODALITE/SnowIndexComputation/service

#Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt && \
    pip3 install numpy && \
    pip3 install pillow


#Install Mysql 
RUN apt-get update && \
    apt-get -y install mysql-server

RUN python3 config.py && \
    apt-get clean;

EXPOSE 5005

#ENTRYPOINT ["python3", "snow_index_service.py"]


