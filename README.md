<h1 align=center>Dockette / Vercel</h1>

<p align=center>
   ▲ Docker images with preinstalled Node.js + Vercel for easy-to-use.
</p>

<p align=center>
🕹 <a href="https://f3l1x.io">f3l1x.io</a> | 💻 <a href="https://github.com/f3l1x">f3l1x</a> | 🐦 <a href="https://twitter.com/xf3l1x">@xf3l1x</a>
</p>

-----

## Usage

**Basic**

If you whatever reason don't want to use [Vercel CLI](https://vercel.com/download).

```
docker run \ 
    -it \
    --rm \
    -v $(pwd)/srv \
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

## Development

See [how to contribute](https://contributte.org/contributing.html) to this package.

This package is currently maintaining by these authors.

<a href="https://github.com/f3l1x">
    <img width="80" height="80" src="https://avatars2.githubusercontent.com/u/538058?v=3&s=80">
</a>

-----

Consider to [support](https://contributte.org/partners.html) **dockette** development team.
Also thank you for using this package.
