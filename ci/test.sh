#!/usr/bin/env bash

set -e

echo $CHANGED_DIRS

# echo "1"
# git diff --name-only master...

git fetch origin -vvv
git ls-remote origin
git branch -a

echo "2"
git diff --name-only origin/master...


echo "$SERVICE is us! Calling $SERVICE/ci/test.sh"
"services/"$SERVICE/ci/test.sh
