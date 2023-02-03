#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2023-11-26
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.0.27

# EOL: 2024-11-25
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.1.14

# EOL: 2025-12-08
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.2.2
