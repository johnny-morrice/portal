#!/bin/bash

REMOTE=$1

if [[ -z $REMOTE ]]; then
	echo "Usage: $0 REMOTE" 1>&2
	exit 1
fi

ssh -L36525:localhost:36525 $REMOTE