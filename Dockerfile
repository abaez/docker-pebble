FROM alpine:latest
MAINTAINER Alejandro Baez <https://twitter.com/a_baez>

# pebble tool version
ENV PVER v4.3

# install pre depends
RUN apk add -U curl git

# install lang depends
RUN apk add python python-dev
RUN curl -s https://bootstrap.pypa.io/get-pip.py | python -

# install pebble tool
RUN git clone -b $PVER https://github.com/pebble/pebble-tool.git /tool
WORKDIR /tool
RUN pip install -r requirements.txt && rm /root/.cache/ -r

# make pebble user env
RUN adduser --disabled-password --gecos "" --ingroup users pebble && \
    echo "pebble ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chmod -R 777 /tool && \
    mkdir -p /home/pebble/.pebble-sdk/ && \
    chown -R pebble:users /home/pebble/.pebble-sdk && \
    touch /home/pebble/.pebble-sdk/ENABLE_ANALYTICS

USER pebble

WORKDIR /pebble
VOLUME  /pebble

ENTRYPOINT ["/usr/bin/python", "/tool/pebble.py"]

RUN ["-h"]