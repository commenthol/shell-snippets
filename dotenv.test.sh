#!/usr/bin/env sh

. ./dotenv.sh

echo --- no export on each line

dotenv

export
echo FOO=$FOO
echo BAZ=$BAZ
echo COMMENTED=$COMMENTED

echo --- export on each line

. ./.env-export

export
echo FOO=$FOO
echo BAZ=$BAZ
echo COMMENTED=$COMMENTED
