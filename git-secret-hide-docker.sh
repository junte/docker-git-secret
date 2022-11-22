#!/bin/bash

docker run \
  -v "$(dirname ~/gpg/secret.gpg):/gpg" \
  -v "$(pwd)":"$(pwd)" \
  -w "$(pwd)" 
  junte/git-secret:0.3.1 \
  bash -c "git secret hide" 
