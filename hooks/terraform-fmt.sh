#!/usr/bin/env bash

set -euo pipefail

# OSX GUI apps do not pick up environment variables the same way as Terminal apps and there are no easy solutions,
# especially as Apple changes the GUI app behavior every release (see https://stackoverflow.com/q/135688/483528). As a
# workaround to allow GitHub Desktop to work, add this (hopefully harmless) setting here.
export PATH=$PATH:/usr/local/bin

for file in "$@"; do
  pushd "$(dirname "$file")" >/dev/null
  terraform fmt -write=true "$(basename "$file")" || true
  popd >/dev/null
done
