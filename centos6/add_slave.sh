#!/bin/bash

cp -f ../keys/* ./
chmod 600 id_rsa
bash ../add_slave.sh "$1" centos6.4 centos6