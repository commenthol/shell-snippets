#!/usr/bin/env sh

# for running this test make sure to have a https server with valid certs up and running
# cd test
# # generate the certificates
# ./site.sh
# # start the server
# node server.js
# # now start the tests
# ./scripts/test-run.sh

CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

if [ "$container" =  "podman" -o "$container" =  "oci" ]; then

	CA_DIR=/usr/local/share/ca-certificates
	test ! -d $CA_DIR && mkdir $CA_DIR
	cp test/certs/root_ca.crt $CA_DIR

	sh ./update_certificates.sh

	ls -al /etc/ssl/cert.pem
	ls -al /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem

	cd "$CWD/test/clients"
	./install.sh #> /dev/null 2>&1
	./test.sh

fi
