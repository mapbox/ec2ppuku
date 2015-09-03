#!/usr/bin/env bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $dir/ec2ppuku /usr/bin
cp $dir/ec2ppuku.conf /etc/init
start ec2ppuku
