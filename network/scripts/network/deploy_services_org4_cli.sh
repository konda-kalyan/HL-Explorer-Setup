#!/bin/bash

GLOBAL_ENV_LOCATION=$PWD/.env
source $GLOBAL_ENV_LOCATION
set -ev 

# ORG 4

docker stack deploy -c "$CLI_SERVICE_ORG4_COMPOSE_PATH" hlf_services_cli
sleep 3
