#!/bin/bash

source common.sh

# $1 - docker tag

[ -z "$1" ] && TAG="centos5.9" || TAG="$1"

LIST=$($docker ps | grep jenkins-slave:$TAG | awk '{print $1}')
[ -n "$LIST" ] && $docker stop `echo "$LIST"`
