#!/bin/bash

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
SCRIPTNAME=$(basename $0)

cd $SCRIPTDIR

for FILE in *
do
  TARGET="$HOME/.$FILE"

  [ $FILE != $SCRIPTNAME ] &&
    if [ -e $TARGET ]; then
      [ ! -h $TARGET ] && echo "$TARGET exists, please remove it first"
    else
      ln -s $SCRIPTDIR/$FILE ~/.$FILE 2> /dev/null &&
      echo "linked $SCRIPTDIR/$FILE to ~/.$FILE"
    fi
done

# symlinks don't seem to work for this file
cp -r config/karabiner/* ~/.config/karabiner/
