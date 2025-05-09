#!/bin/bash

if ! [ -e "$1" ]; then
	echo "Invalid file."
else
ln -s $(realpath $1) -t $(realpath ~/qrshared/)
cd ~/code/qrshare

ip=$(ifconfig | grep -Eo 'inet (addr:)?([1-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
file=$(basename $1)
qrencode -m 2 -t utf8 <<< "http://$ip:5000/file/$(printf %s $file|jq -sRr @uri)"
flask run -h 0.0.0.0
cd -
fi
