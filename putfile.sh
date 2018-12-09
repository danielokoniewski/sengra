#!/bin/bash

user=$1
pw=$2
domain=$3
remotepath=$4
localpath=$5

for f in $(ls $localpath);
do

curl -X PUT -u "${user}:${pw}" \
	https://${domain}/remote.php/dav/files/${user}/${remotepath}/${f} \
	-T "${localpath}/${f}"
done
