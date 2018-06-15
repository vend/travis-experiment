#!/usr/bin/env bash

# In a multi component branch make sure we actually have modified dirs, if not stop build

set -e

MODIFIED_DIRS=$(./ci/modified_dirs.sh)

echo -e "Directories with changes:\n$MODIFIED_DIRS\n"

if [[ $MODIFIED_DIRS == "" ]] ; then
    echo -e "No files were modified, FAIL BUILD"
    exit 1
else
    echo -e "Have changes, PROCEED"
    exit 0
fi
