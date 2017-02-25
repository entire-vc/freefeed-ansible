#!/bin/sh

apt-get purge -y python-pip
wget https://bootstrap.pypa.io/get-pip.py
python ./get-pip.py
apt-get install -y python-pip
