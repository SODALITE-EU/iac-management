FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

COPY /SnowMaskComputation/service/ SnowWatch-SODALITE/SnowMaskComputation/service/
COPY /config.json SnowWatch-SODALITE/
COPY /data/ SnowWatch-SODALITE/data/

WORKDIR SnowWatch-SODALITE/SnowMaskComputation/service/

#Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    apt install -y libgl1-mesa-glx && \
    apt install -y libglib2.0-0 && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

EXPOSE 5000

#ENTRYPOINT ["python3", "snow_mask_service.py"]

