#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal
ARG ARCH=x86_64

#--------------------------------------
# base images
#--------------------------------------
FROM amd64/ubuntu:bionic@sha256:4bc3ae6596938cb0d9e5ac51a1152ec9dcac2a1c50829c74abd9c4361e321b26 as build-bionic-x86_64
FROM amd64/ubuntu:focal@sha256:b4f9e18267eb98998f6130342baacaeb9553f136142d40959a1b46d6401f0f2b as build-focal-x86_64


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO}-${ARCH} as builder

ARG APT_PROXY
ARG ARCH
ARG DISTRO

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
