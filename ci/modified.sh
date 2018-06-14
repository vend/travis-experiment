#!/usr/bin/env bash

set -e

if [[ $TRAVIS_BRANCH == "master" ]]; then
    CHANGED_DIRS=$(git log -m -1 --name-only --pretty="format:" $TRAVIS_COMMIT | grep . | sort | uniq)
else
    CHANGED_DIRS=$(git fetch -q origin master && git diff --name-only FETCH_HEAD... | awk -F '/' '/.*\// {print $1 "/" $2 }' | sort | uniq)
fi

echo -e "Directories with changes:\n$CHANGED_DIRS"

for CHANGED_DIR in $CHANGED_DIRS
do
    if [[ "$CHANGED_DIR" == "services/$SERVICE" ]]; then
        echo -e "Service $SERVICE was updated"
        exit 0
    fi
done

echo -e "Service $SERVICE was NOT updated, skipping"

exit 1
