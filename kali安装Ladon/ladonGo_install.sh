#!/bin/bash

go version
ret=$?
if [ $ret -ne 0 ];then
	sed -i '$a export GO111MODULE=on \nexport GOPROXY=http://goproxy.io' /etc/profile
	source /etc/profile
	wget -c https://storage.googleapis.com/golang/go1.15.11.linux-amd64.tar.gz
	tar -C /usr/local/ -xzf go1.15.11.linux-amd64.tar.gz
	sed -i '$a export PATH=$PATH:/usr/local/go/bin' /etc/profile
	source /etc/profile
fi

go get github.com/k8gege/LadonGo
cd  /root/go/pkg/mod/github.com/k8gege/
dir=`ls`
cd $dir
go build Ladon.go
mv Ladon.go ../
make linux
make install
mv ../Ladon.go ./