FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive

COPY /SnowMaskComputation/service/ SnowWatch-SODALITE/SnowMaskComputation/service/

WORKDIR SnowWatch-SODALITE/SnowMaskComputation/service/

#Install Python and python reqs
RUN apt update && \
    apt install -y python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install -r requirements.txt


#ENTRYPOINT ["python3", "snow_mask_service.py"]

