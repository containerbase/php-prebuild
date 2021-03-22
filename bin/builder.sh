#!/bin/bash

set -e

VERSION=${1}

CODENAME=$(. /etc/os-release && echo ${VERSION_CODENAME})

NAME=python
BUILD_ARGS=

if [[ "${DEBUG}" == "true" ]]; then
  BUILD_ARGS="-v"
fi

# https://github.com/php-build/php-build/issues/564
export PHP_BUILD_CONFIGURE_OPTS="--disable-intl --disable-cgi --disable-fpm --disable-xdebug"

echo "Building ${NAME} ${VERSION} for ${CODENAME}"
php-build ${BUILD_ARGS} ${VERSION} /usr/local/${NAME}/${VERSION}

/usr/local/${NAME}/${VERSION}/bin/php --info


echo "Compressing ${NAME} ${VERSION} for ${CODENAME}"
tar -cJf /cache/${NAME}-${VERSION}-${CODENAME}.tar.xz -C /usr/local/${NAME} ${VERSION}
