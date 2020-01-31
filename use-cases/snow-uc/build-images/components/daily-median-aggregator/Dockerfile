FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

#Get Daily Median Aggregator SECRET REQUIRED
RUN apt-get update && \
    apt install -y git-all && \ 
    git clone https://gitlab.com/wds-co/SnowWatch-SODALITE && \
    #cd DailyMedianAggregator


#Install Python and python reqs
RUN apt-get update && \
    apt-get -y install python && \
    apt-get -y install curl && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install -r SnowWatch-SODALITE/DailyMedianAggregator/requirements.txt


#Install Mysql SECRET REQUIRED
RUN apt-get update && \
    apt-get install mysql-server && \
    python config.py
    mysql -u root -p && \
    apt-get clean;




