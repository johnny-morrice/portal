#!/bin/bash

MACHINE=$1
PORT=$2

if [[ -z $MACHINE ]] || [[ -z $PORT ]]; then
    echo "USAGE: $0 MACHINE PORT" 1>&2
    exit 1
fi

sshfs localhost: -p$PORT $MACHINE