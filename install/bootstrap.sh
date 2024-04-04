#!/bin/bash

source "$(dirname "$0")/utilities.sh"

if [[ $(uname) == 'Darwin' ]]; then
  source "$(dirname "$0")/setup-macos.sh"
fi
