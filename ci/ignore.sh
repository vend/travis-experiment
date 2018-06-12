#!/usr/bin/env bash

set -e

if [[ $SERVICE == "service2" ]]; then
    echo 0
else
    echo 1
fi
