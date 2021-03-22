#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/buildpack.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/buildpack.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/buildpack.conf

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
  build-essential \
  ca-certificates \
  curl \
  dumb-init \
  git \
  file \
  libbz2-dev \
  libc-client2007e-dev \
  libcurl4-gnutls-dev \
  libjpeg-dev \
  libkrb5-dev \
  libmcrypt-dev \
  libonig-dev \
  libpng-dev \
  libreadline-dev \
  libssl-dev \
  libtidy-dev \
  libxml2-dev \
  libxslt-dev \
  libzip-dev \
  pkg-config \
  zlib1g-dev \
  ;

git clone https://github.com/php-build/php-build.git;
PREFIX=/usr/local ./php-build/install.sh

mkdir -p /usr/local/php /cache
