#!/bin/bash

base=$( realpath $( dirname $0 ) )

docker build -t 0lfi/drupal $base/docker || exit 1

mkdir -p $base/volumes/drupal
mkdir -p $base/volumes/mysql

docker network create --attachable -d overlay drupal 2> /dev/null

docker stack deploy -c $base/drupal.yml drupal
