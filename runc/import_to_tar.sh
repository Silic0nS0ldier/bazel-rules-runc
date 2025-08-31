#!/usr/bin/env bash
# Mock of the docker/podman import command that "imports" to a `.tar` file at `$IMPORT_TO_TAR_OUT`.
# Expects to be called with `--import [fd]` where `[fd]` is a file descriptor such as ` /dev/fd/63`
set -euo pipefail

cat "${3:-}" > "$IMPORT_TO_TAR_OUT"
