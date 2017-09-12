#!/bin/bash
# make script for docker to push to dockerhub
# usage: ./make.sh version

COMPANY_ACCOUNT=omalab
NAME=cassandra
VERSION=$1

if [ $# -eq 0 ]
  then
    echo "Version number must be supplied."
    exit 2
fi

set -xeu
echo "$1" > 'VERSION'
cd cassandra
docker build -t $NAME:$1 .
docker tag $NAME:$VERSION omalab/$NAME:$VERSION
docker push $COMPANY_ACCOUNT/$NAME:$VERSION
cd ..
