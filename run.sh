#!/bin/bash

base=$( realpath $( dirname $0 ) )

docker build -t 0lfi/drupal $base/docker || exit 1

mkdir -p $base/volumes/drupal
mkdir -p $base/volumes/mysql

cd $base
docker network create --attachable -d overlay drupal
docker stack deploy -c drupal.yml drupal
