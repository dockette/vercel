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

## Usage

**Basic**

If you whatever reason don't want to use [Vercel CLI](https://vercel.com/download).

```
docker run \
    -it \
    --rm \
    -v "$(pwd)":/srv \
    dockette/vercel \
    vercel -t [token] --scope [team] -c
```

**Gitlab CI**

If you whatever reason don't want to use [Vercel for Gitlab](https://vercel.com/gitlab).

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

The release version is the date in [`VERSION`](VERSION). CI pushes `latest` also as `dockette/vercel:<VERSION>`.
To release, run `make release`, commit and push to `master`.

## Development

```sh
make build
make test
make run
make version
make release
```

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
