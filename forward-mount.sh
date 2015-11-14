#!/bin/bash

MACHINE=$1
sshfs localhost: -p36525 $MACHINE

