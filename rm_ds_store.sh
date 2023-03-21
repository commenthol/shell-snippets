#!/usr/bin/env sh

#----
# Remove all .DS_Store files from current directory on
#
# To reset finder views start with either $HOME or for removable disks with the
# mounted Volume

find . -name ".DS_Store" -exec rm {} \;
