#!/usr/bin/env bash

set -e

CHANGED_DIRS111=$(git fetch origin master && git diff --name-only FETCH_HEAD... | awk -F '/' '/.*\// {print $1 "/" $2 }' | sort | uniq)

JOINED=""
for CHANGED_DIR in $CHANGED_DIRS111
do
    JOINED="$JOINED@$CHANGED_DIR@"
done

echo $JOINED