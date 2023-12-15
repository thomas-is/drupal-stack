#!/bin/bash

base=$( realpath $( dirname $0 ) )

docker run --rm drupal tar -cC /var/www/html/sites . \
  | tar -xC $base/volumes/html/sites
