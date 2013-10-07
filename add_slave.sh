#!/bin/bash

source common.sh

# $1 - instance name
# $2 - docker tag
# $3 - jenkins label

[ -z "$2" ] && TAG="centos5.9" || TAG="$2"
[ -z "$3" ] && LABEL="centos5" || LABEL="$3"

TEMPLATE="antigluk/jenkins-slave:$TAG"
LABEL="docker-$LABEL"

# docker build -t antigluk/jenkins-slave .
ID=$($docker run -d -p 22 "$TEMPLATE")

#wait sshd to spin up
sleep 2

IP=$($docker inspect $ID | grep IPAddress | sed -r 's/^[^:]*: "([^"]*)".*$/\1/g')
echo "IP: $IP"

sudo chmod 600 keys/id_rsa
DO="ssh -i keys/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no jenkins@$IP"

$DO 'sudo sed -i "s/^127\.0\.0\.1/127\.0\.0\.1 $(hostname) /" /etc/hosts'


# $DO java -jar swarm-client-*.jar -help
nohup $DO "java -jar swarm-client-*.jar -master http://172.17.42.1:8070 -mode exclusive -labels \"$LABEL\" -executors 1 -fsroot /var/lib/jenkins -name \"$1\" -username sandbox -password hadoop" & 2>/dev/null

echo "Slave $1 added"
