FROM debian:11-slim

ENV GIT_SECRETS_VERSION=0.5.0

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    gnupg=2.2.* \
    wget=1.*\
    apt-transport-https \
    ca-certificates \
    && sh -c "echo 'deb https://gitsecret.jfrog.io/artifactory/git-secret-deb git-secret main' >> /etc/apt/sources.list" \
    && wget -qO - 'https://gitsecret.jfrog.io/artifactory/api/gpg/key/public' | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends git-secret=${GIT_SECRETS_VERSION} \
    && apt-get remove --purge -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /.gnupg \
    && chmod 777 /.gnupg
