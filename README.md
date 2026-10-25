<h1 align=center>Dockette / Vercel</h1>

<p align=center>
   <a href="https://github.com/dockette/vercel/actions"><img src="https://github.com/dockette/vercel/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/vercel"><img src="https://img.shields.io/docker/pulls/dockette/vercel.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   ▲ Docker image with preinstalled Node.js + Vercel for easy-to-use.
</p>

-----

Node.js, npm, git and the Vercel CLI on Alpine, for deploys from CI.

## Usage

Run the Vercel CLI from the current directory, if you for whatever reason do not want to use the
[Vercel CLI](https://vercel.com/download) itself.

```sh
docker run -it --rm -v "$(pwd)":/srv dockette/vercel vercel -t [token] --scope [team] -c
```

In GitLab CI, if you for whatever reason do not want to use [Vercel for GitLab](https://vercel.com/gitlab):

```yml
stages:
 - deploy

develop:
  stage: deploy
  image: dockette/vercel
  only:
    - develop
  script:
    - vercel -t $VERCEL_TOKEN --scope $VERCEL_TEAM -c

production:
  stage: deploy
  image: dockette/vercel
  only:
    - master
  script:
    - vercel -t $VERCEL_TOKEN --scope $VERCEL_TEAM -c
```

## Versions

| Version | Release |
|---------|---------|
| `dockette/vercel:YYYY.MM.DD` | release `YYYY.MM.DD` |
| `dockette/vercel:latest` | latest build of `master` |

All versions build on `dockette/alpine:3.24` with the Vercel CLI from npm at build time. Releases are listed on
[GitHub](https://github.com/dockette/vercel/releases).

## Development

```sh
make build          # build linux/amd64 and linux/arm64
make test           # check vercel and node
make run            # open node in the image, with the current directory in /srv
make version        # print VERSION
make release        # set today's date in VERSION
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to
[support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
