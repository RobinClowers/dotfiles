#!/bin/bash

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
SCRIPTNAME=$(basename $0)

cd $SCRIPTDIR
for FILE in *
do
  [ $FILE != $SCRIPTNAME ] && ln -s $SCRIPTDIR/$FILE ~/.$FILE 2> /dev/null && echo "linked $SCRIPTDIR/$FILE to ~/.$FILE"
done
