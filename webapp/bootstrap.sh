#!/bin/bash

HOME=/root
GIT_BRANCH=${GIT_BRANCH:-"master"}

echo "$SSH_KEY" > $HOME/.ssh/id_rsa; chmod 600 $HOME/.ssh/id_rsa

cd /home/app/webapp
git clone $GIT_REPO --branch $GIT_BRANCH --single-branch .
bundle install --path vendor/bundle
