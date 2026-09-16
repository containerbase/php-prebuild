#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=resolute

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214 AS build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:829f6df217bcbae2b371026e81711d1a787c61b2967ad09d015063663ebafbf7 AS build-jammy
FROM ghcr.io/containerbase/ubuntu:26.04@sha256:5cf058a7d21293819d67c8514b422f782570e5f5126126201d0f1bcbb74f6414 AS build-resolute


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} AS builder

ARG APT_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
