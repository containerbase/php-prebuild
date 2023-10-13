#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:59f5f8b43ebcd48f0cad95b16570b17e67bcedf8455394011d0922fd4db668ad as build-focal
FROM ubuntu:jammy@sha256:e4e00f1b61658b116ea6f9c787e16b4aa7e833352d17dcacb02c884729377ac1 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

ARG APT_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
