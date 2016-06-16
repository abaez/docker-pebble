FROM alpine:latest
MAINTAINER Alejandro Baez <https://twitter.com/a_baez>

# 4.3 64bit
ENV SDK https://s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-4.3-linux64.tar.bz2

RUN useradd pebble

# install pre depends
RUN apk add -U curl bash

# install lang depends
RUN apk add python ruby perl

RUN curl -s https://bootstrap.pypa.io/get-pip.py | python -

RUN curl -S $SDK | tar -C /pebble -xjf -

WORKDIR /pebble
RUN pip install -r requirements.txt
RUN rm /root/.cache/ -r


