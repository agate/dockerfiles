#!/bin/bash

if [[ -z $POST_SCRIPT ]]; then
  echo "POST_SCRIPT not set. Skip..."
else
  echo "Running POST_SCRIPT from $POST_SCRIPT"
  curl -s $POST_SCRIPT | /bin/bash
fi
