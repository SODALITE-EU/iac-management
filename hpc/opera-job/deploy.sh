#!/bin/bash

if [ ! -f inputs.yml ] || [ ! -f service.yml ]; then
    echo "Building inputs.yml and service.yml"
    ./prepare.sh
fi

opera deploy -i inputs.yml service.yml