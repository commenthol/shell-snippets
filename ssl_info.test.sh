#!/usr/bin/env sh

. ./ssl_info.sh

echo
echo --- ssl_info

ssl_info gitlab.com 443 -brief

ssl_info self-signed.badssl.com

echo
echo --- ssl_dates

ssl_dates badssl.com

ssl_dates expired.badssl.com

echo
echo --- ssl_is_valid

ssl_is_valid badssl.com
ssl_is_valid expired.badssl.com
