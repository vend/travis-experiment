#!/usr/bin/env bash

set -e

#CHANGED_DIRS=$(git diff --name-only master...  | awk -F '/' '/.*\// {print $1 "/" $2 "/"}' | sort | uniq)

#CHANGED_DIRS=$(ls -1 services)

echo $CHANGED_DIRS

for CHANGED_DIR in $CHANGED_DIRS
do
    if [[ $CHANGED_DIR == $SERVICE ]]; then
        echo "$SERVICE is us! Calling $SERVICE/ci/test.sh"
        "services/"$SERVICE/ci/test.sh
        break
    fi
done
