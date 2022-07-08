#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch


# EOL: 2022-11-28
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=7.4.30

# EOL: 2023-11-26
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.0.21

# EOL: 2024-11-25
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.1.7
