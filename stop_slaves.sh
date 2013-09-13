#!/bin/bash

LIST=$(docker ps | grep jenkins-slave:centos5.9 | awk '{print $1}')
[ -n "$LIST" ] && docker stop `echo "$LIST"`
