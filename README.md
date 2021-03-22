![build](https://github.com/containerbase/php/workflows/build/badge.svg)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/containerbase/php)
![GitHub](https://img.shields.io/github/license/containerbase/php)

# ContainerBase PHP releases

Prebuild PHP releases used by [containerbase/buildpack](https://github.com/containerbase/buildpack).

## Local development

Build the image

```bash
docker build -t builder --build-arg APT_PROXY=http://apt-proxy:3142 .
```

Test the image

```bash
docker run --rm -it -e DEBURG=true builder 8.0.3
```

Optional environment variables

- `APT_PROXY`: Set an APT http proxy for installing build deps
- `DEBUG`: Show verbose php build output
