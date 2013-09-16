#!/bin/bash

# $1 - docker tag

[ -z "$1" ] && TAG="centos5.9" || TAG="$1"

LIST=$(docker -H=127.0.0.1:4243 ps | grep jenkins-slave:$TAG | awk '{print $1}')
[ -n "$LIST" ] && docker -H=127.0.0.1:4243 stop `echo "$LIST"`
