#!/bin/bash

set -e

VERSION=${1}

CODENAME=$(. /etc/os-release && echo ${VERSION_CODENAME})

NAME=php
ARCH= $(uname -p)
BUILD_ARGS=

if [[ "${DEBUG}" == "true" ]]; then
  BUILD_ARGS="-v"
  export PHP_BUILD_DEBUG=yes
fi

# https://github.com/php-build/php-build/blob/6530e7501ccc758928d5510813dc3f5fbdc87419/man/php-build.1.ronn#environment
# https://github.com/php-build/php-build/issues/564
export PHP_BUILD_CONFIGURE_OPTS="--disable-intl --disable-cgi --disable-fpm" PHP_BUILD_XDEBUG_ENABLE=off

echo "Building ${NAME} ${VERSION} for ${CODENAME}"
php-build ${BUILD_ARGS} ${VERSION} /usr/local/${NAME}/${VERSION}

/usr/local/${NAME}/${VERSION}/bin/php --info


echo "Compressing ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
tar -cJf /cache/${NAME}-${VERSION}-${CODENAME}-${ARCH}.tar.xz -C /usr/local/${NAME} ${VERSION}
