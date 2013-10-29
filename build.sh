#!/bin/bash

source common.sh

# $1 - directory
# $2 - docker tag
echo `pwd`
[ -z "$2" ] && TAG="centos5.9" || TAG="$2"

cp keys/id_rsa keys/id_rsa.pub keys/known_hosts keys/authorized_keys "$1"
$docker build -t antigluk/jenkins-slave:$TAG "$1"
rm -f "$1"/id_rsa "$1"/id_rsa.pub "$1"/known_hosts "$1"/authorized_keys
