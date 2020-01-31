FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

#Get Webcam Crawler SECRET REQUIRED
RUN apt-get update && \
    apt install -y git-all && \ 
    git clone https://gitlab.com/wds-co/SnowWatch-SODALITE && \
    #cd WebCamCrawler

#change db file with our credentials

#Install Mysql SECRET REQUIRED
RUN apt-get update && \
    apt-get install mysql-server && \
    mysql -u root -p < db/wc_crawler.sql && \
    apt-get clean;

#Install Nodejs

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && \
    apt-get -y install curl

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8.9

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
