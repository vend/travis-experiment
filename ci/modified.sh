#!/usr/bin/env bash

set -e

if [[ $TRAVIS_BRANCH == "master" ]]; then
    CHANGED_FILES=$(git log -m -1 --name-only --pretty="format:" $TRAVIS_COMMIT)
else
    CHANGED_FILES=$(git fetch -q origin master && git diff --name-only FETCH_HEAD...)
fi

CHANGED_DIRS=$(echo $CHANGED_FILES | awk -F '/' '/services\/.*\// {print $1 "/" $2 }' | sort | uniq)

echo "Branch: $TRAVIS_BRANCH"
echo "Commit: $TRAVIS_COMMIT"
echo -e "Directories with changes:\n$CHANGED_DIRS\n"

for CHANGED_DIR in $CHANGED_DIRS
do
    if [[ "$CHANGED_DIR" == "services/$SERVICE" ]]; then
        echo -e "Service $SERVICE was updated, PROCEED"
        exit 0
    fi
done

echo -e "Service $SERVICE was NOT updated, SKIP"

exit 1
