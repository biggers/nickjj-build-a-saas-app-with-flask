# docker/Dockerfile  -*-conf-*-
# image-ref: https://hub.docker.com/_/python/

FROM python:3.6-slim-stretch

ENV INSTALL_PATH /snakeeyes
ENV PYTHONUNBUFFERED 1
ENV USER flask

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

RUN  groupadd -r $USER && \
    useradd -r -g $USER $USER && \
    apt-get -y update && \
    apt-get -y install  netcat less vim-tiny jove make && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD []
# CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "snakeeyes.app:create_app()"
