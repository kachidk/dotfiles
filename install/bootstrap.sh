#!/bin/bash

source "$(dirname "$0")/utils.sh"

# Create your links
if [[ $(uname) == 'Darwin' ]]; then
  source "$(dirname "$0")/setup-macos.sh"
fi
