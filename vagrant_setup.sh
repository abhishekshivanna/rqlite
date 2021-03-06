#!/bin/bash

# Dependencies
add-apt-repository ppa:git-core/ppa -y
echo "Updating..."
apt-get update
apt-get install -y curl git bison make mercurial sqlite3

# Golang
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ~/.gvm/scripts/gvm
gvm install go1.4
gvm use go1.4

# Rqlite
mkdir -p rqlite
cd rqlite
export GOPATH=$PWD
go get github.com/otoolep/rqlite/...
ln -s $GOPATH/bin/rqlited /usr/local/bin/rqlited
