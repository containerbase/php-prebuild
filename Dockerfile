# syntax=docker/dockerfile:1
#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:ed4a42283d9943135ed87d4ee34e542f7f5ad9ecf2f244870e23122f703f91c2 as build-focal
FROM ubuntu:jammy@sha256:2b7412e6465c3c7fc5bb21d3e6f1917c167358449fecac8176c6e496e5c1f05f as build-jammy
FROM ghcr.io/containerbase/base:9.23.4@sha256:e8869f1ad144504ccfb2ad625c6948aa4b44049ec7043c3ce66109e099a0c5d8 as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

# ARG APT_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]


# Set env and shell
ENV BASH_ENV=/usr/local/etc/env ENV=/usr/local/etc/env PATH=/home/ubuntu/bin:$PATH
SHELL ["/bin/bash" , "-c"]

CMD [ "bash" ]

# Set up containerbase
COPY --from=containerbase /usr/local/bin/ /usr/local/bin/
COPY --from=containerbase /usr/local/containerbase/ /usr/local/containerbase/
RUN install-containerbase

RUN install-apt fuse


RUN set -ex; \
  curl -sSLo /usr/local/bin/appimage-builder https://github.com/AppImageCrafters/appimage-builder/releases/download/v1.1.0/appimage-builder-1.1.0-x86_64.AppImage; \
  chmod +x /usr/local/bin/appimage-builder; \
  true


COPY bin /usr/local/bin
COPY app  /app
WORKDIR /app
# RUN install-builder.sh
