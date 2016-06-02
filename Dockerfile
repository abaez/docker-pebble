FROM alpine:latest
MAINTAINER Alejandro Baez <https://twitter.com/a_baez>

# install pre depends
RUN apk add -U curl bash

# install lang depends
RUN apk add python ruby perl

RUN curl -s https://bootstrap.pypa.io/get-pip.py | python -

RUN pip install virtualenv

RUN useradd pebble

RUN curl -S https://s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-4.2-linux64.tar.bz2 | tar -xjf -


