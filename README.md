# Git Secret (Docker Image)

This repository tracks the Dockerfile and build/release scripts needed to
maintain a docker image for [git-secret](http://git-secret.io/).

I needed this primarily because I wanted to use `git secret` on a Travis CI
build, but I could not install the gpg version I needed (2.2+) to maintain
consistency with my personal development environments.

## Info

Image contains:

- Ubuntu: 18.04
- gpg: 2.2
- git-secret: 0.5.0

## Usage

### Reveal

```bash
docker run \
 -it \
 --rm \
 -v "$(pwd)/gpg:/gpg" \
 -v "$(pwd):$(pwd)" \
 -w "$(pwd)" \
 ghcr.io/junte/docker-git-secret:0.5.0 \
 bash -c "gpg --batch --import /gpg/secret.gpg && git secret reveal -v -P -f" 
```

### Hide

```bash
docker run \
 --rm \
 -v "$(pwd)/gpg:/gpg" \
 -v "$(pwd):$(pwd)" \
 -w "$(pwd)" \
 ghcr.io/junte/docker-git-secret:0.5.0 \
 bash -c "gpg --batch --import /gpg/secret.gpg && gpg --list-key && git secret hide -P -m" 
```
