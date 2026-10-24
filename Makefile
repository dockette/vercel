DOCKER_IMAGE=dockette/vercel
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64
VERSION:=$(shell cat VERSION)

.PHONY: build test run

build:
	docker buildx build --platform ${DOCKER_PLATFORMS} -t ${DOCKER_IMAGE}:${DOCKER_TAG} .

test:
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} vercel --version
	docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG} node --version

run:
	docker run --rm -it -v "$${PWD}":/srv ${DOCKER_IMAGE}:${DOCKER_TAG}

.PHONY: version
version:
	@echo ${VERSION}

.PHONY: release
release:
	@date -u +%Y.%m.%d > VERSION
	@echo "VERSION: ${VERSION} -> $$(cat VERSION)"
	@echo "next: git commit -am \"Release: $$(cat VERSION)\" && git push"
