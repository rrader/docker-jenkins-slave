#!/bin/bash

source ../local_settings.sh

mkdir -p ./resources
cp -R ../keys/* ./resources

$docker build -t antigluk/jenkins-slave-centos6-java .
