#!/usr/bin/env sh

# set -x

. ./assert_cmds.sh

assert_cmds sh
echo ok

assert_cmds sh not_there_cmd ls xx_yy_zz
echo fail
