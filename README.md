![build](https://github.com/containerbase/php-prebuild/actions/workflows/build.yml/badge.svg)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/containerbase/php-prebuild)
![GitHub](https://img.shields.io/github/license/containerbase/php-prebuild)

# containerbase PHP releases

Prebuild PHP releases used by [containerbase/buildpack](https://github.com/containerbase/buildpack).

## Local development

Build the image

```bash
docker build -t builder --build-arg APT_PROXY=http://apt-proxy:3142 --build-arg DISTRO=focal .
```

Test the image

```bash
docker run --rm -it -v ${PWD}/.cache:/cache -e DEBURG=true builder 8.0.3
```

`${PWD}/.cache` will contain packed releases after successful build.

Optional environment variables

| Name        | Description                                                   | Default   |
| ----------- | ------------------------------------------------------------- | --------- |
| `DISTRO`    | Set an ubuntu base distro, `focal` and `bionic` are supported | `focal`   |
| `APT_PROXY` | Set an APT http proxy for installing build deps               | `<empty>` |
| `DEBUG`     | Show verbose php build output                                 | `<empty>` |
