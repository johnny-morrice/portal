#!/bin/bash

MACHINE=$1
PORT=$2

if [[ -z $MACHINE ]] || [[ -z $PORT ]]; then
    echo "Usage: $0 MACHINE PORT" 1>&2
    exit 1
fi

ssh -L$PORT:$MACHINE:22 \
    -N \
    $(<$HOME/.dev_machine.txt)
