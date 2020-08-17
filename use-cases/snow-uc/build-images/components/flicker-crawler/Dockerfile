# syntax = docker/dockerfile:1.0-experimental
FROM ubuntu

# run this dockerfile with command:
# DOCKER_BUILDKIT=1 docker build --secret id=password,src=password.txt --progress=plain .
ARG DEBIAN_FRONTEND=noninteractive

COPY /FlickerCrawler/ SnowWatch-SODALITE/FlickerCrawler/

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean

#Install Mysql
RUN apt-get update && \
    apt-get -y install mysql-server && \
    apt-get clean

#ENTRYPOINT ["java", "-cp", "FlickerCrawler-0.0.1-SNAPSHOT-jar-with-dependencies.jar" #"it.polimi.s776390.flickr.FlickrPhotoCollector" "-d"]

#ENTRYPOINT ["java", "-cp", "FlickerCrawler-0.0.1-SNAPSHOT-jar-with-dependencies.jar" #"it.polimi.s776390.flickr.FlickrImageDownloader"]
