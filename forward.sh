#!/bin/bash

REMOTE=$1
PORT=$2

if [[ -z $REMOTE ]] || [[ -z $PORT]]; then
	echo "Usage: $0 REMOTE PORT" 1>&2
	exit 1
fi

ssh -L$PORT:localhost:$PORT $REMOTE