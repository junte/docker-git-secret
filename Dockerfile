FROM ubuntu:bionic-20200807

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git          \
        gnupg=2.2.*  \
        gawk         \
        wget=1.*  \ 
        apt-transport-https \
        ca-certificates \
        apt-utils \
    && echo "deb https://dl.bintray.com/sobolevn/deb git-secret main" | tee -a /etc/apt/sources.list \
    && wget -qO - https://api.bintray.com/users/sobolevn/keys/gpg/public.key | apt-key add - \
    && apt-get update \
    && apt-get install -y git-secret=0.3.1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
