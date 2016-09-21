#!/usr/bin/env bash

# exit on error
set -eu

ecs-preconfigure.sh "$@"

ecs-cli compose -f $ECS_DEPLOYMENT --project-name data \
 service up \
 --deployment-max-percent $AWS_ECS_TASK_MAX_PERCENT \
 --deployment-min-healthy-percent $AWS_ECS_TASK_HEALTH_MIN_PERCENT

ecs-cli compose -f $ECS_DEPLOYMENT --project-name data \
 scale \
 --deployment-max-percent $AWS_ECS_TASK_MAX_PERCENT \
 --deployment-min-healthy-percent $AWS_ECS_TASK_HEALTH_MIN_PERCENT \
 $AWS_ECS_TASK_SIZE