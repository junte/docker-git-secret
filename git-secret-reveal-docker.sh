#!/bin/bash

# Read Password
echo -n Password: 
read -s PASSWORD 
echo

# Run Command
command="gpg --batch --import /gpg/secret.gpg && git secret reveal -P -p $PASSWORD"

docker run             \
  -v "$(dirname ~/gpg/secret.gpg):/gpg"   \
  -v `pwd`:`pwd`       \
  -w `pwd`             \
  junte/git-secret:0.3.1 \
  bash -c "$command"
