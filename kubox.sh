#!/bin/bash

#
# container repo image
#
IMAGE=tcotav/kubox

#
# get what namespace we will be working in.  
#
if [ ! -z "$1" ]
  then
  NS=--namespace=${1}
fi

# swiped from
# https://gist.github.com/earthgecko/3089509
UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 6 | head -n 1|tr '[:upper:]' '[:lower:]')
POD=kubox-${UUID} 

kubectl run -i --tty ${POD} --image=${IMAGE} --generator="run-pod/v1" ${NS}

echo "remove pod with: "
echo "   kc delete pod ${POD} ${NS}"

