FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

ARG DEBIAN_FRONTEND="noninteractive"

# Fix stale NodeSource repo inherited from the base image.
RUN rm -f /etc/apt/sources.list.d/nodesource.list /etc/apt/sources.list.d/nodesource.list.save

COPY /root/etc/apt/preferences.d/firefox-no-snap /etc/apt/preferences.d/firefox-no-snap
COPY options.json /
COPY /root/ /

RUN \
  echo "**** install base packages ****" && \
  add-apt-repository -y ppa:mozillateam/ppa && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y firefox jq wget curl ca-certificates && \
  chmod +x /install-de.sh && \
  /install-de.sh && \
  chmod +x /installapps.sh && \
  /installapps.sh && \
  rm -f /installapps.sh

RUN \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

EXPOSE 3000
VOLUME /config
