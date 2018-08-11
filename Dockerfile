FROM phusion/baseimage:0.10.1
# Dockerfile for mesa development
LABEL maintainer="Allen Lee <allen.lee@asu.edu>"

ENV PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
    && apt-get install -y --no-install-recommends \
    git \
    python3-pip \
    python3-setuptools \
    && pip3 install mesa \
    && rm -rf /var/lib/apt/lists/* \
    && apt purge -y git

WORKDIR /opt
RUN git clone https://github.com/projectmesa/mesa
WORKDIR /opt/mesa/examples
