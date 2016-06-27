#!/bin/bash

#
# container repo image
#
IMAGE=tcotav/kubox:1.02

#
# get what namespace we will be working in.  
#
if [ ! -z "$1" ]
  then
  NS=--namespace=${1}
fi

NUM_CHARS_GEN=6

# swiped char string gen from
# https://gist.github.com/earthgecko/3089509
OS=`uname -a | cut -d " " -f 1`
if [ "$OS" == "Darwin" ];then
  UUID=$(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${NUM_CHARS_GEN} | head -n 1|tr '[:upper:]' '[:lower:]')
else 
  # default to linux
  UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${NUM_CHARS_GEN} | head -n 1|tr '[:upper:]' '[:lower:]')
fi
# mac

POD=kubox-${UUID} 
echo "Creating pod: ${POD}..."
kubectl run -i --tty ${POD} --image=${IMAGE} --generator="run-pod/v1" ${NS}

echo "remove pod with: "
echo "   kc delete pod ${POD} ${NS}"

