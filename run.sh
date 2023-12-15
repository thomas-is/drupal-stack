#!/bin/bash

base=$( realpath $( dirname $0 ) )

mkdir -p $base/volumes/mysql
mkdir -p $base/volumes/html/modules
mkdir -p $base/volumes/html/profiles
mkdir -p $base/volumes/html/sites/default/files/translations
mkdir -p $base/volumes/html/themes

sudo chown -Rv 33:33 $base/volumes/html

docker network create --attachable -d overlay drupal
docker stack deploy -c drupal.yml drupal
