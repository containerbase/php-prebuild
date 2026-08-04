#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=resolute

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214 AS build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:3b06811b2afd352be909dd088a004166d665dc76d38b13eada33522a9d915c6f AS build-jammy
FROM ghcr.io/containerbase/ubuntu:26.04@sha256:678c6550cc43645e08669028bc177f50be4e7c5b8cca677067b1914d4afc7a03 AS build-resolute


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} AS builder

ARG APT_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
