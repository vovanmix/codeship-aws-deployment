#!/usr/bin/env bash

# exit on error
set -eu

ecs-preconfigure.sh "$@"

ecs-cli compose -f $ECS_DEPLOYMENT service up
