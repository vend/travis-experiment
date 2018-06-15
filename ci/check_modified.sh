#!/usr/bin/env bash

set -e

MODIFIED_DIRS=$(./ci/modified_dirs.sh)

echo -e "Directories with changes:\n$MODIFIED_DIRS\n"

for MODIFIED_DIR in $MODIFIED_DIRS
do
    if [[ "$MODIFIED_DIR" == "$COMPONENT_TYPE/$COMPONENT_NAME" ]]; then
        echo -e "Component $COMPONENT_TYPE $COMPONENT_NAME was modified, PROCEED"
        exit 0
    fi
done

echo -e "Component $COMPONENT_TYPE $COMPONENT_NAME was NOT modified, SKIP"
exit 1
