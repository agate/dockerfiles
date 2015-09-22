#!/bin/bash

if [[ -z $PRE_SCRIPT ]]; then
  echo "PRE_SCRIPT not set. Skip..."
else
  echo "Running PRE_SCRIPT from $PRE_SCRIPT"
  curl -s $PRE_SCRIPT | /bin/bash
fi
