# Start from a Python3.7 base image I published

# FROM xavierrrr/xrrzero:stretchpython3.7
FROM python:3.9-alpine

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
#ENV LANG C.UTF-8

RUN apk add --update build-base glib-dev
RUN apk add --update bluez-dev

RUN pip3 install bluepy
RUN pip3 install requests
RUN pip3 install pybluez

RUN apk add --update bash mosquitto-clients

WORKDIR /app
COPY ["LYWSD03MMC.py", "bluetooth_utils.py", "./"]
COPY ["sendToMQTT_HA.sh", "./"]

# ENTRYPOINT service dbus start
#Change to the following line to match your needs
CMD while true; do \
    python -u LYWSD03MMC.py \
    -a -r -b 100 \
    --callback sendToMQTT_HA.sh; \
    sleep 2; \
  done

# start the created image with sudo docker run --net=host -t your_image_name /bin/bash
