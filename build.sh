#!/bin/bash

VERSION=1.02
BASE=tcotav/kubox

sudo docker build -t $BASE:$VERSION .
echo $BASE:$VERSION
sudo docker push $BASE:$VERSION 

