FROM ubuntu:kinetic

ARG DEBIAN_FRONTEND=noninteractive
    
COPY /Snowwatch-Render/ SnowWatch-SODALITE/Snowwatch-Render/
COPY /config.json SnowWatch-SODALITE/


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
    && nvm use default && \
    apt-get -y install npm


WORKDIR /SnowWatch-SODALITE/Snowwatch-Render/node-server

EXPOSE 3000

RUN npm install --production
RUN npm i -g pm2 
RUN npm start
