#!/bin/bash

TEMPLATE="antigluk/jenkins-slave:centos5.9"
LABEL="docker-centos5"

# docker build -t antigluk/jenkins-slave .
ID=$(docker run -d -p 22 "$TEMPLATE")

IP=$(docker inspect $ID | grep IPAddress | sed -r 's/^[^:]*: "([^"]*)".*$/\1/g')
echo "IP: $IP"

DO="ssh -i id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no jenkins@$IP"

$DO 'sudo sed -i "s/^127\.0\.0\.1/127\.0\.0\.1 $(hostname) /" /etc/hosts'


# $DO java -jar swarm-client-*.jar -help
nohup $DO "java -jar swarm-client-*.jar -master http://172.17.42.1:8070 -mode exclusive -labels \"$LABEL\" -executors 1 -fsroot /var/lib/jenkins -name \"$1\" -username sandbox -password hadoop" &
