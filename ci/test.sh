#!/usr/bin/env bash

set -e

echo "$COMPONENT_TYPE $COMPONENT_NAME is us!"
echo "Calling $COMPONENT_TYPE/$COMPONENT_NAME/ci/test.sh"
"$COMPONENT_TYPE/$COMPONENT_NAME"/ci/test.sh

# pretend we do some work
sleep 60
