# syntax = docker/dockerfile:1.0-experimental
FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

COPY /FlickerCrawler/ SnowWatch-SODALITE/FlickerCrawler/
WORKDIR SnowWatch-SODALITE/FlickerCrawler/

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get install -y maven && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean

#Install Mysql
RUN apt-get update && \
    apt-get -y install mysql-server && \
    apt-get clean

RUN mvn clean install

WORKDIR target/

#ENTRYPOINT ["java", "-cp", "FlickerCrawler-0.0.1-SNAPSHOT-jar-with-dependencies.jar" #"it.polimi.s776390.flickr.FlickrPhotoCollector" "-d"]

#ENTRYPOINT ["java", "-cp", "FlickerCrawler-0.0.1-SNAPSHOT-jar-with-dependencies.jar" #"it.polimi.s776390.flickr.FlickrImageDownloader"]
