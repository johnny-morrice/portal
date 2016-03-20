#!/bin/bash
set -e

REMOTE=$1

if [[ -z $REMOTE ]]; then
    echo "Usage: $0 REMOTE" 1>&2
    exit 1
fi

CLEAN_REMOTE=$(echo $REMOTE | tr -d /)

if hash klist 2>/dev/null; then
    klist -t
else
    true
fi
if [[ $? -ne 0 ]]; then
    kinit
fi



sshfs "$CLEAN_REMOTE:" $CLEAN_REMOTE
