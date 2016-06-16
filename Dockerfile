FROM alpine:latest
MAINTAINER Alejandro Baez <https://twitter.com/a_baez>

# pebble tool version
ENV PVER v4.3

RUN useradd pebble

# install pre depends
RUN apk add -U curl git

# install lang depends
RUN apk add python python-dev

RUN curl -s https://bootstrap.pypa.io/get-pip.py | python -

RUN git clone -b $PVER https://github.com/pebble/pebble-tool.git /tool

WORKDIR /tool
RUN pip install -r requirements.txt && rm /root/.cache/ -bash r

RUN python install.py install

ENTRYPOINT ["/usr/bin/python", "pebble.py"]

RUN ["-h"]
