#!/bin/bash

source ../local_settings.sh

$docker run -d --name="$1" antigluk/jenkins-slave-centos7-java -labels docker-centos7-java -name "$1"
