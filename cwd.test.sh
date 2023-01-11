#!/usr/bin/env sh

. ./cwd.sh

# get full path of current working directory
echo $CWD
# get last dir name
echo ${CWD##*/}
