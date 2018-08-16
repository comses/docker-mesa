FROM phusion/baseimage:0.11
# dev tagged Dockerfile for mesa development, installs from github
LABEL maintainer="Allen Lee <allen.lee@asu.edu>"

ENV PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    MESA_VERSION=0.8.4

WORKDIR /opt/mesa

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python3-dev \
    python3-pip \
    python3-setuptools \
    && pip3 install wheel \
    && git clone https://github.com/projectmesa/mesa . \
    && python3 setup.py install \
    && apt purge -y git \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code
