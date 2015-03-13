#!/bin/bash

source ../local_settings.sh

mkdir -p ./resources
cp -R ../keys/* ./resources

$docker build -t antigluk/jenkins-slave-centos7-java .


#cd ../
#bash build.sh centos6 centos6.4
