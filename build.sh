#!/bin/bash

# $1 - docker tag
echo `pwd`
[ -z "$2" ] && TAG="centos5.9" || TAG="$2"

sudo docker build -t antigluk/jenkins-slave:$TAG "$1"
