#!/usr/bin/env bash

set -e

echo $CHANGED_DIRS

# echo "1"
# git diff --name-only master...

git fetch origin master -vvv
git checkout -b master --no-track origin/master
git diff --name-only master...


echo "$SERVICE is us! Calling $SERVICE/ci/test.sh"
"services/"$SERVICE/ci/test.sh
