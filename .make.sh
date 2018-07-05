#!/usr/bin/env bash
############################
# .make.sh dir
# This script creates symlinks from the current user's home directory to each
# item in dir. It prepends a dot to each item's destination name.
############################

rm -rf .backup
mkdir .backup

for path in *; do
    file=`basename $path`
    dest=~/.$file
    source=`pwd`/$file
    mv $dest .backup
    ln -s $source $dest
    echo "Linked $dest to $source"
done
