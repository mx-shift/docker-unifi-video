FROM lsiobase/xenial

ARG BUILD_DATE
ARG VCS_REF

# package versions
ARG UNIFI_VIDEO_VER="3.10.2"

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kc8apf/docker-unifi-video" \
      org.label-schema.version=$UNIFI_VIDEO_VER \
      org.label-schema.schema-version="1.0"

# add mongo unifi-video repos
RUN \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 82C6571E && \
 echo "deb [arch=amd64] http://www.ubnt.com/downloads/unifi-video/apt-3.x xenial ubiquiti" >> /etc/apt/sources.list.d/unifi-video.list

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
    unifi-video=${UNIFI_VIDEO_VER}

# cleanup
RUN \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# Volumes and Ports
WORKDIR /usr/lib/unifi-video
VOLUME /config
EXPOSE 7080/tcp 7443/tcp 6666/tcp 7442/tcp 7445/tcp 7446/tcp 7447
