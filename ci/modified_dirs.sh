#!/usr/bin/env bash

set -e

if [[ $TRAVIS_BRANCH == "master" ]]; then
    MODIFIED_FILES=$(git log -m -1 --name-only --pretty="format:" $TRAVIS_COMMIT)
else
    MODIFIED_FILES=$(git fetch -q origin master && git diff --name-only FETCH_HEAD...)
fi

# We are only monitoring srv/ and lib/ dirs for changes requiring CI/CD
MODIFIED_DIRS=$(echo "$MODIFIED_FILES" | awk -F '/' '/^(srv|lib)\// {print $1 "/" $2 }' | sort | uniq)

echo $MODIFIED_DIRS
