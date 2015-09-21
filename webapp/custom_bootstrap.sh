#!/bin/bash

if [ -n $START_SCRIPT ]; then
  curl -s $START_SCRIPT | /bin/bash
fi
