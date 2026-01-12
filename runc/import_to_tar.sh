#!/usr/bin/env bash
# Mock of the docker/podman import command that "imports" to a `.tar` file at `$IMPORT_TO_TAR_OUT`.
# Expects to be called with `--import [fd]` where `[fd]` is a file descriptor such as ` /dev/fd/63`
set -euo pipefail

# Check if the third argument (file descriptor) is provided
if [[ -z "${3:-}" ]]; then
    echo "Error: No file descriptor provided as third argument" >&2
    exit 1
fi
input="$3"

# Check if the file descriptor exists and is readable
if [[ ! -r "$input" ]]; then
    echo "Error: File descriptor '$input' does not exist or is not readable" >&2
    exit 1
fi


echo "Piping tarball from $input to $IMPORT_TO_TAR_OUT"
cat "$input" > "$IMPORT_TO_TAR_OUT"
echo "Done."
