#!/usr/bin/env bash

set -e

echo $CHANGED_DIRS

echo "$SERVICE is us! Calling $SERVICE/ci/test.sh"
"services/"$SERVICE/ci/test.sh
