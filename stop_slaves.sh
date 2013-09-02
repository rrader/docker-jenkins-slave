#!/bin/bash

LIST=$(docker ps | grep jenkins-slave | awk '{print $1}')
[ -n "$LIST" ] && docker stop `echo "$LIST"`
