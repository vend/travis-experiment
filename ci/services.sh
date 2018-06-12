#!/usr/bin/env bash

set -e

CHANGED_DIRS=$(git diff --name-only master...  | awk -F '/' '/.*\// {print $1 "/" $2 "/"}' | sort | uniq)

for CHANGED_DIR in $CHANGED_DIRS
do
    echo "<$CHANGED_DIR>"
done
