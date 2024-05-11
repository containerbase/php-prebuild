#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2024-11-25
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.1.28

# EOL: 2025-12-08
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.2.19

# EOL: 2026-11-23
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.3.7
