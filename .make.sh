#!/usr/bin/env bash
############################
# .make.sh dir
# This script creates symlinks from the current user's home directory to each
# item in this dir. It prepends a dot to each item's destination name.
############################

rm -rf .backup
mkdir .backup

for path in *; do
    src=$(pwd)/$path
    dest=~/.$(basename $src)
    mv $dest .backup
    ln -s $src $dest
    echo "Linked $dest to $src"
done
