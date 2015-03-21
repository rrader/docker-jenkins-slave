#!/bin/bash

JENKINS_PORT=8080

show_help() {
    echo "Jenkins-In-Container Management"
    echo "  -h show this help"
    echo
    echo "Available commands:"
    echo "  up"
    echo "  build <template>"
    echo "  add <template> <name>"
    echo "  stop <template> <name>"
}

djs_up() {
    cd master
    vagrant up

    IP=$(vagrant ssh-config | grep 'HostName' | awk '{print $2}')
    echo -e "\n\n=================================================="
    echo -e "Jenkins should be available on $IP:$JENKINS_PORT"
    echo -e "Start using slaves with building appropriate\n e.g. # ./djs.sh build centos7-java"
    cd -
}

djs_build() {
    cd master
    vagrant ssh -c "cd /djs/slaves/$1 && sudo bash build.sh"
    cd -
}

djs_add() {
    cd master
    vagrant ssh -c "cd /djs/slaves/$1 && sudo bash add_slave.sh $2"
    cd -
}

djs_stop() {
    cd master
    vagrant ssh -c "cd /djs/slaves/$1 && sudo bash stop_slave.sh $2"
    cd -
}


while getopts "h?" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    esac
done

if [ -z "$1" ]; then
    show_help
    exit 0
fi

if [ "$1" == "up" ]; then
    djs_up
elif [ "$1" == "build" ]; then
    djs_build "$2"
elif [ "$1" == "add" ]; then
    djs_add "$2" "$3"
else
    echo "Unrecognized command"
    show_help
fi
