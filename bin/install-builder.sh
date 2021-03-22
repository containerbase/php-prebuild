#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf

if [[ ! -z "${APT_PROXY+x}" ]]; then
  echo "Acquire::http::proxy \"${APT_PROXY}\";" | tee -a /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi

export DEBIAN_FRONTEND=noninteractive

# https://github.com/php-build/php-build/blob/6530e7501ccc758928d5510813dc3f5fbdc87419/install-dependencies.sh#L34
apt-get update -q
apt-get install -q -y \
  autoconf \
  build-essential \
  ca-certificates \
  curl \
  dumb-init \
  git \
  file \
  libbz2-dev \
  libc-client2007e-dev \
  libcurl4-gnutls-dev \
  libicu-dev \
  libjpeg-dev \
  libkrb5-dev \
  libmcrypt-dev \
  libonig-dev \
  libpng-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libtidy-dev \
  libxml2-dev \
  libxslt-dev \
  libzip-dev \
  pkg-config \
  re2c \
  zlib1g-dev \
  ;

if [[ ! -z "${APT_PROXY+x}" ]]; then
  rm -f /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi

git clone https://github.com/php-build/php-build.git;
PREFIX=/usr/local ./php-build/install.sh

mkdir -p /usr/local/php /cache
