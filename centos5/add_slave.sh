#!/bin/bash

cp -f ../keys/* ./
chmod 600 id_rsa
bash ../add_slave.sh "$1" centos5.9 centos5