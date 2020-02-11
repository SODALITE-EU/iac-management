FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

# Get Webcam Crawler
# clone https://gitlab.com/wds-co/SnowWatch-SODALITE.git to build context before building
COPY SnowWatch-SODALITE/WebCamCrawler/ SnowWatch-SODALITE/WebCamCrawler/
COPY SnowWatch-SODALITE/config.json SnowWatch-SODALITE/config.json



#Install Mysql
RUN apt-get update && \
    apt-get -y install mysql-server && \
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

WORKDIR SnowWatch-SODALITE/WebCamCrawler/

ENV PATH $PATH:/usr/local/nvm/versions/node/v8.9.4/bin

ENTRYPOINT ["node", "index.js"]
CMD ["1,2,3,4,5"]

