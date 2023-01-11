#!/usr/bin/env sh

CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

. "$CWD"/../has_cmd.sh
. "$CWD"/../package_tool.sh

if [ $MY_TEST ]; then
	if [ $(has_cmd bash) -ne 0 ]; then
		package_update
		package_install bash
	fi
	if [ $(has_cmd openssl) -ne 0 ]; then
		package_update
		package_install openssl
	fi
	if [ $(has_cmd arp) -ne 0 ]; then
		package_update
		package_install net-tools
	fi
	# needed for debian:bullseye-slim
	"$CWD"/../update_certificates.sh
fi

sh "$CWD"/../test_all.sh 2>&1 | tee "$CWD"/../logs/$LOG.log
