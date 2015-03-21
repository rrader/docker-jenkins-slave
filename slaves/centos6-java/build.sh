#!/bin/bash

source ../local_settings.sh

$docker build -t antigluk/jenkins-slave-centos6-java .
