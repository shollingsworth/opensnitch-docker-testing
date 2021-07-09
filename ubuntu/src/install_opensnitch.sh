#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

cd /repo

# install dependencies
export GOPATH=~/go #you may want to change this if your Go directory is different
export PATH=$PATH:$GOPATH/bin
go get github.com/golang/protobuf/protoc-gen-go
python3 -m pip install --user grpcio-tools
python3 -m pip install --user --upgrade protobuf
pip3 install --upgrade -r ui/requirements.txt
# clone the repository 
# compile && install
make

# custom installer, no systemd
pushd daemon
sudo mkdir -p /etc/opensnitchd/rules
sudo cp opensnitchd /usr/local/bin/
sudo cp default-config.json /etc/opensnitchd/
sudo cp system-fw.json /etc/opensnitchd/
popd

pushd ui
sudo make install
