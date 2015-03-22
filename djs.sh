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
    cd - > /dev/null
    echo -e "\n=================================================="
    djs_ip
    echo -e "Start using slaves with adding one\n e.g. # ./djs.sh add centos7-java Luke"
}

djs_destroy() {
    cd master
    vagrant destroy -f
    cd - > /dev/null
}

djs_ip() {
    cd master
    IP=$(vagrant ssh-config | grep 'HostName' | awk '{print $2}')
    echo -e "Jenkins should be available on $IP:$JENKINS_PORT"
    cd - > /dev/null
}

djs_build() {
    cd master
    vagrant ssh -c "cd /djs/slaves/$1 && sudo bash build.sh"
    cd - > /dev/null
}

djs_add() {
    cd master
    vagrant ssh -c "cd /djs/slaves/$1 && sudo bash add_slave.sh $2"
    cd - > /dev/null
}

djs_stop() {
    cd master
    vagrant ssh -c "cd /djs/slaves/$1 && sudo bash stop_slave.sh $2"
    cd - > /dev/null
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
elif [ "$1" == "ip" ]; then
    djs_ip
elif [ "$1" == "destroy" ]; then
    djs_destroy
elif [ "$1" == "build" ]; then
    djs_build "$2"
elif [ "$1" == "add" ]; then
    djs_add "$2" "$3"
else
    echo "Unrecognized command"
    show_help
fi
