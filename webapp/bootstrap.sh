#!/bin/bash

GIT_BRANCH=${GIT_BRANCH:-"master"}

echo "$SSH_KEY" > /home/app/.ssh/id_rsa
chmod 600 /home/app/.ssh/id_rsa
chown app:app /home/app/.ssh/id_rsa

# In China, set rubygems source to taobao mirror.

su - app -c "\
  gem sources --remove https://rubygems.org/; \
  gem sources -a https://ruby.taobao.org/; \
  bundle config mirror.https://rubygems.org https://ruby.taobao.org; \
  \
  cd /home/app/webapp; \
  git clone $GIT_REPO --branch $GIT_BRANCH --single-branch .; \
  \
  bundle install --path vendor/bundle; \
  bower install"
