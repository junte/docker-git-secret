PWD = $(shell pwd)

SECRETS_DOCKER_IMAGE=ghcr.io/junte/docker-git-secret:0.5.0
UID=$(shell id -u)
GID=$(shell id -g)

# -- git secret --

secrets-reveal:
	@docker run \
	-it \
	--rm \
	-v "${PWD}/gpg:/gpg" \
	-v "${PWD}:${PWD}" \
	-w "${PWD}" \
	--user ${UID}:${GID} \
	${SECRETS_DOCKER_IMAGE} \
	bash -c "gpg --batch --import /gpg/secret.gpg && git secret reveal -v -P -f" 

secrets-hide:
	@docker run \
	--rm \
	-v "${PWD}/gpg:/gpg" \
	-v "${PWD}:${PWD}" \
	-w "${PWD}" \
	--user ${UID}:${GID} \
	${SECRETS_DOCKER_IMAGE} \
	bash -c "gpg --batch --import /gpg/secret.gpg && gpg --list-key && git secret hide -P -m" 

secrets-shell:
	@docker run \
	-it \
	--rm \
	-v "${PWD}/gpg:/gpg" \
	-v "${PWD}:${PWD}" \
	-w "${PWD}" \
	--user ${UID}:${GID} \
	${SECRETS_DOCKER_IMAGE} \
	bash
