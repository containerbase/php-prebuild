#-------------------------
# renovate rebuild trigger
# https://www.php.net/supported-versions.php
#-------------------------

# makes lint happy
FROM scratch


# EOL: 2026-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.2.33

# EOL: 2027-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.3.33

# EOL: 2028-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.4.25

# EOL: 2029-12-31
# renovate: datasource=docker depName=php versioning=docker
ENV PHP_VERSION=8.5.10
