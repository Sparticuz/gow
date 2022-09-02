FROM ubuntu:22.04 AS base

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ "Etc/UTC"

# Taken from https://github.com/jessfraz/dockerfiles/blob/master/pulseaudio/
RUN apt-get update && apt-get install -y --no-install-recommends \
    alsa-utils \
    libasound2 \
    libasound2-plugins \
    pulseaudio \
    && rm -rf /var/lib/apt/lists/*

# Copy Configuration
COPY pulseaudio/configs/default.pa /etc/pulse/default.pa
COPY pulseaudio/configs/client.conf /etc/pulse/client.conf
COPY pulseaudio/configs/daemon.conf /etc/pulse/daemon.conf
COPY pulseaudio/scripts/startup.sh /startup.sh

# Common scripts
COPY --chmod=777 common/* /bin/

# Add non-root home folder
RUN mkdir -p /tmp/pulse/home && \
    chmod 777 /tmp/pulse -R

ENV HOME /tmp/pulse/home
WORKDIR $HOME

# Run pulseaudio
CMD /bin/bash /startup.sh

ARG IMAGE_SOURCE
LABEL org.opencontainers.image.source $IMAGE_SOURCE
