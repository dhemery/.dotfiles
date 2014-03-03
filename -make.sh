#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
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
