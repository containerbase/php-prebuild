#!/bin/bash

set -e

VERSION=${1}

# shellcheck disable=SC1091
CODENAME=$(. /etc/os-release && echo "${VERSION_CODENAME}")

NAME=php
ARCH=$(uname -p)
BUILD_ARGS=

if [[ "${DEBUG}" == "true" ]]; then
  BUILD_ARGS="-v"
  export PHP_BUILD_DEBUG=yes
fi

SEMVER_REGEX="^(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))?(\.(0|[1-9][0-9]*))?([a-z-].*)?$"

function check_semver () {
  if [[ ! "${1}" =~ ${SEMVER_REGEX} ]]; then
    echo Not a semver like version - aborting: "${1}" >&2
    exit 1
  fi
  export MAJOR=${BASH_REMATCH[1]}
  export MINOR=${BASH_REMATCH[3]}
  export PATCH=${BASH_REMATCH[5]}
}

if [[ ! -f "/usr/local/share/php-build/definitions/${VERSION}" ]]; then
  echo "Missing build definition for ${VERSION}. Trying to find older patch build definition"
  check_semver "${VERSION}"
  if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
    echo Invalid version: "${TOOL_VERSION}" >&2
    exit 1
  fi
  oldVersion=$(find /usr/local/share/php-build/definitions -type f -name "${MAJOR}.${MINOR}.*" -printf '%f\n' | sort --version-sort -r | head -n 1)

  if [[ -z $oldVersion ]]; then
    echo "No usable definition found" >&2
    exit 1
  fi

  echo "Using $oldVersion"

  cp "/usr/local/share/php-build/definitions/$oldVersion" "/usr/local/share/php-build/definitions/${VERSION}"
  sed -i "s/php-${oldVersion}/php-${VERSION}/" "/usr/local/share/php-build/definitions/${VERSION}"
  cat "/usr/local/share/php-build/definitions/${VERSION}"
fi

# disable xdebug
sed 's/install_xdebug/#install_xdebug/' -i "/usr/local/share/php-build/definitions/${VERSION}"

# https://github.com/php-build/php-build/blob/6530e7501ccc758928d5510813dc3f5fbdc87419/man/php-build.1.ronn#environment
# https://github.com/php-build/php-build/issues/564
export PHP_BUILD_CONFIGURE_OPTS="--disable-intl --disable-cgi --disable-fpm --disable-phpdbg --disable-shared --enable-static" PHP_BUILD_XDEBUG_ENABLE=off

echo "Building ${NAME} ${VERSION} for ${CODENAME}"
php-build ${BUILD_ARGS} "${VERSION}" "/usr/local/${NAME}/${VERSION}"

"/usr/local/${NAME}/${VERSION}/bin/php" --version

file "/usr/local/${NAME}/${VERSION}/bin/php"
#ldd "/usr/local/${NAME}/${VERSION}/bin/php"

echo "Compressing ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
tar -cJf "/cache/${NAME}-${VERSION}-${CODENAME}-${ARCH}.tar.xz" -C /usr/local/${NAME} "${VERSION}"
