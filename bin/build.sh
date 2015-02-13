#!/bin/bash

USAGE="Usage: $0 [ site_name ]"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )
SITE=$1

if [ -z "$1" ] ; then
  echo "$USAGE"
  exit 1
fi

if [ ! -d "$DIR/$SITE" ] ; then
  echo "Site: $DIR/$SITE not found!"
  exit 1
fi

if [ "$(uname)" == "Darwin" ]; then
  PGM="hugo_0.12_darwin_amd64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  PGM="hugo_0.12_linux_amd64"
fi

OPTIONS="
--config=$DIR/$SITE/config.toml
--source=$DIR/$SITE
--disableRSS=true
--disableSitemap=false"

$DIR/bin/$PGM $OPTIONS

