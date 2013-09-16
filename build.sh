#!/bin/bash

# $1 - directory
# $2 - docker tag
echo `pwd`
[ -z "$2" ] && TAG="centos5.9" || TAG="$2"

sudo docker -H=127.0.0.1:4243 build -t antigluk/jenkins-slave:$TAG "$1"
