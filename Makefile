DOCKER_IMAGE=dockette/vercel
DOCKER_TAG?=latest
DOCKER_PLATFORMS?=linux/amd64,linux/arm64
include VERSION

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
	@sed -i.bak "s/^VERSION=.*/VERSION=$$(date -u +%Y.%m.%d)/" VERSION && rm VERSION.bak
	@cat VERSION
