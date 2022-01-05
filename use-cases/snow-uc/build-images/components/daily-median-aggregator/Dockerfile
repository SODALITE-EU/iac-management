FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Get Daily Median Aggregator
# clone https://gitlab.com/wds-co/SnowWatch-SODALITE.git and copy this file in SnowWatch-SODALITE dir
COPY DailyMedianAggregator/ SnowWatch-SODALITE/DailyMedianAggregator/
COPY config.json SnowWatch-SODALITE/config.json

WORKDIR SnowWatch-SODALITE/DailyMedianAggregator/

# Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install -r requirements.txt

# Install MYSQL and some packages for openCV
RUN apt-get update && \
    apt-get install -y libsm6 libxext6 libxrender-dev mysql-server && \
    python3 config.py && \
    apt-get clean;

ENTRYPOINT ["python3", "main.py"]
CMD ["2019-12-04", "6666"]



