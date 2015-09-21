#!/bin/bash

if [ -n $PRE_SCRIPT ]; then
  curl -s $PRE_SCRIPT | /bin/bash
fi
