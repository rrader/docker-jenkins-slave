#!/bin/bash

source ../local_settings.sh

$docker run -d --name="$1" -v /tmp/docker-m2cache:/root/.m2:rw antigluk/jenkins-slave-centos7-java -labels docker-centos7-java -name "$1"
