#!/usr/bin/env bash

set -e

CHANGED_DIR10=$(./ci/services.sh)

echo "****$CHANGED_DIR10****"

echo "$SERVICE is us! Calling $SERVICE/ci/test.sh"
"services/"$SERVICE/ci/test.sh
