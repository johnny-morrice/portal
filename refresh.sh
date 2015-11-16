#!/bin/sh

REMOTE=$1

if [[ -z $REMOTE ]]; then
    echo "Usage: $0 REMOTE" 1>&2
    exit 1
fi

umount $REMOTE
portal/mount.sh $REMOTE
