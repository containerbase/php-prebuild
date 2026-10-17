#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=resolute

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214 AS build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:0a9887931b0e38af2e3487ed39e29436b0535c4f3f52e57745baaf79d1898956 AS build-jammy
FROM ghcr.io/containerbase/ubuntu:26.04@sha256:c098726dd9b9733f3e885f8de0ef375206a311b0a317eadc40d347b1115fb944 AS build-resolute


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} AS builder

ARG APT_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
