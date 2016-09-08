#!/usr/bin/env bash

# exit on error
set -eu

ecs-preconfigure.sh "$@:2"

ecs-cli compose -f /deployment.yml up
