#!/usr/bin/env bash

set -e

CHANGED_DIRS=$(git fetch -q origin master && git diff --name-only FETCH_HEAD... | awk -F '/' '/.*\// {print $1 "/" $2 }' | sort | uniq)

for CHANGED_DIR in $CHANGED_DIRS
do
    if [[ "$CHANGED_DIR" == "services/$SERVICE" ]]; then
        exit 0
    fi
done

exit 1