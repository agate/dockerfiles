#!/bin/bash

if [ -n $POST_SCRIPT ]; then
  curl -s $POST_SCRIPT | /bin/bash
fi
