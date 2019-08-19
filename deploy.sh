#!/bin/bash

stg=$1
[ "$stg" = "" ] && stg="dev"

rm -rf ./buildfile
mkdir ./buildfile

cat ./serverless.yml |
grep 'handler'       |
awk '{print $2}'     |
while read line; do
    ./build.sh $line || exit 1
done &&
sls deploy -s $stg
