#!/bin/bash

source ../local_settings.sh

$docker stop "$1"
$docker rm "$1"
