#!/bin/bash

export XOPERA_ARTIFACTS_LOCATION=$(pwd)/artifacts

envsubst < inputs.yml.tmpl > inputs.yml
envsubst < service.yml.tmpl > service.yml