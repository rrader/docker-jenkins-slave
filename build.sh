#!/bin/bash

# $1 - docker tag

[ -z "$1" ] && TAG="centos5.9" || TAG="$1"

sudo docker build -t antigluk/jenkins-slave:$TAG .