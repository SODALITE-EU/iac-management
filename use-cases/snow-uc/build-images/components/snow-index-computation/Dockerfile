FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

COPY /SnowIndexComputation/service/ SnowWatch-SODALITE/SnowIndexComputation/service/

WORKDIR SnowWatch-SODALITE/SnowIndexComputation/service

#Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt


#Install Mysql 
RUN apt-get update && \
    apt-get -y install mysql-server && \
    python3 config.py && \
    apt-get clean;

#ENTRYPOINT ["python3", "snow_index_service.py"]


