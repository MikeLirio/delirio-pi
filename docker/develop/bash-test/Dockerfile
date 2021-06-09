# Mainpage of Docker Hub Ubuntu https://hub.docker.com/_/ubuntu
FROM ubuntu:20.04

USER root

RUN mkdir /opt/github

RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

RUN cd /opt/github && \
    git clone https://github.com/MikeLirio/delirio-pi.git && \
    cd delirio-pi