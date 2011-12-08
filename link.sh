#!/bin/bash

cd $(cd $(dirname "$0") && pwd)

SCRIPTNAME=$(basename $0)

for FILE in *
do
  [ $FILE != $SCRIPTNAME ] && cp $FILE ~/.$FILE
done
