#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch


# EOL: 2026-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.2.35

# EOL: 2027-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.3.36

# EOL: 2028-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.4.27

# EOL: 2029-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.5.11
