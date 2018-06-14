#!/usr/bin/env bash

set -e

echo "$SERVICE is us! Calling $SERVICE/ci/test.sh"
"services/"$SERVICE/ci/test.sh

# pretend we do some work
sleep 60
