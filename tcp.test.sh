#!/usr/bin/env sh

. ./tcp.sh

http_get www.duck.com
echo $?
http_get www.google.com 1>/dev/null
echo $?
http_get www.google.com 4431
echo $?

tcp_connect www.google.com
echo $?
tcp_connect www.google.com 4431
echo $?
