#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=7.3.33

# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=7.4.29

# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.0.18
