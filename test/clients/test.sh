#!/bin/sh

URL=https://www.aa.aa:8443

distro () {
	. /etc/os-release
	OS=$NAME
	IS_ALPINE=$(echo $OS | grep Alpine)
}

has_cmd () {
	type $1 > /dev/null 2>&1
	test 0 -eq $? && echo $1
}

HAS_CURL=$(has_cmd curl)

distro

if [ "$(has_cmd curl)" -a "x$IS_ALPINE" != "x" ]; then
	apk update
	apk add curl
fi

if [ "$(has_cmd curl)" ] ; then
	echo === curl ===
	curl $URL
fi

if [ "$(has_cmd java)" ] ; then
	echo === java ===
	java Jhttps $URL
fi

if [ "$(has_cmd node)" ] ; then
	echo === node ===
	# https://nodejs.org/api/cli.html#cli_node_extra_ca_certs_file
	export NODE_EXTRA_CA_CERTS="/etc/ssl/cert.pem"
	node https.js $URL
fi

if [ "$(has_cmd python3)" ]; then
	echo === python3 ===
	python3 -m ensurepip
	python3 -m pip install requests
	export REQUESTS_CA_BUNDLE="/etc/ssl/cert.pem"
	python3 request.py $URL
fi
