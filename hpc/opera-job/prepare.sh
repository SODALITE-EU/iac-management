#!/bin/bash

if [ -z "${XOPERA_ARTIFACTS_LOCATION}" ] || [ -z "${XOPERA_LIBRARY_LOCATION}" ]; then
  echo "Make sure the opera.rc file was sourced"
  echo "  . opera.rc"
  exit 1
fi

envsubst < inputs.yml.tmpl > inputs.yml
envsubst < service.yml.tmpl > service.yml