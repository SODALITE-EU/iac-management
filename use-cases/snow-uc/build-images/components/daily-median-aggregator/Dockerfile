FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

# Get Daily Median Aggregator
# clone https://gitlab.com/wds-co/SnowWatch-SODALITE.git to build context before building
COPY SnowWatch-SODALITE/DailyMedianAggregator/ SnowWatch-SODALITE/DailyMedianAggregator/
COPY SnowWatch-SODALITE/config.json SnowWatch-SODALITE/config.json

WORKDIR SnowWatch-SODALITE/DailyMedianAggregator/

# Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

# Install MYSQL and some packages for openCV
RUN apt-get update && \
    apt-get install -y libsm6 libxext6 libxrender-dev mysql-server && \
    python3 config.py && \
    apt-get clean;

ENTRYPOINT ["python3", "main.py"]
CMD ["2019-12-04", "6666"]



