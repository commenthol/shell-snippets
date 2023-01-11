#!/usr/bin/env sh

. ./echo_stderr.sh

# echo to stdout
echo "INFO for your info"

# echo to stderr
echo_stderr "ERROR this is an error on stderr"

if [ "$1" != "filter" ]; then

echo "filtering..."

# filter stdout
sh ./echo_stderr.test.sh filter 1>/dev/null

# filter stderr
sh ./echo_stderr.test.sh filter 2>/dev/null

fi
