#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2025-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.1.33

# EOL: 2026-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.2.29

# EOL: 2027-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.3.23

# EOL: 2028-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.4.11
