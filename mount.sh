#!/bin/sh

REMOTE=$1

if [[ -z $REMOTE ]]; then
    echo "Usage: $0 REMOTE" 1>&2
    exit 1
fi

CLEAN_REMOTE=$(echo $REMOTE | tr -d /)

klist -t
if [[ $? -ne 0 ]]; then
    kinit
fi



sshfs "$CLEAN_REMOTE:" $CLEAN_REMOTE