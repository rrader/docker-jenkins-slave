#!/bin/bash

source ../local_settings.sh

$docker run -d --name="$1" antigluk/jenkins-slave-centos6-java -labels docker-centos6-java -name "$1"
