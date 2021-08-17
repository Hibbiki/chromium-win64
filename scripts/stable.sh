#!/bin/bash

VERSIONDST=$(curl -s http://omahaproxy.appspot.com/all?csv=1 | grep win,stable)

echo $VERSIONDST | awk -F"," '{print "v"$3"-r"$8}' > ../out/revision
echo $VERSIONDST | awk -F"," '{print $3}'
