FROM phusion/baseimage:0.11
# Dockerfile for mesa development
LABEL maintainer="Allen Lee <allen.lee@asu.edu>"

ENV PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    MESA_VERSION=0.8.5

WORKDIR /opt

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
    && apt-get install -y --no-install-recommends \
    git \
    python3-pip \
    python3-setuptools \
    && pip3 install wheel \
    && pip3 install mesa==${MESA_VERSION} \
    && git clone https://github.com/projectmesa/mesa \
    && rm -rf /var/lib/apt/lists/* \
    && apt purge -y git \
    && apt autoremove -y

WORKDIR /opt/mesa/examples
