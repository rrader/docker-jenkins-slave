#!/bin/bash

source common.sh

# $1 - directory
# $2 - docker tag
echo `pwd`
[ -z "$2" ] && TAG="centos5.9" || TAG="$2"

$docker build -t antigluk/jenkins-slave:$TAG "$1"
