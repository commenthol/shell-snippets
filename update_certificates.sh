#!/usr/bin/env sh

####
# update-ca-certificates on any linux distribution
# make sure that your self-signed root certificates are stored in $CA_DIR
#

set -x

UPDATE_CA_CERTS=update-ca-certificates
CA_DIR=/usr/local/share/ca-certificates
SSL_CERTS_DIR=/etc/ssl/certs
# https://serverfault.com/questions/62496/ssl-certificate-location-on-unix-linux
CERT_PEM=/etc/ssl/cert.pem
JKS_PASS=changeit

has_cmd () {
	type $1 > /dev/null 2>&1
	test $? -eq 0 && echo $1
}

normalize_paths () {
	# modifications for yum based installers
	if [ "$USES_YUM" -o "$USES_DNF" ]; then
		UPDATE_CA_CERTS=update-ca-trust
		local CA_DIR_CENTOS=/etc/pki/ca-trust/source/anchors

		if [ -d "$CA_DIR" ]; then
			test ! -d "$CA_DIR_CENTOS" && mkdir -p "$CA_DIR_CENTOS"
			cp "$CA_DIR"/* "$CA_DIR_CENTOS"
		fi

		CA_DIR="$CA_DIR_CENTOS"
	fi
}

install () {
	if ! has_cmd $UPDATE_CA_CERTS; then
		if [ $USES_APK ]; then
			$PKGINSTALL update -q && $PKGINSTALL add ca-certificates
		else
			$PKGINSTALL update -y -q && $PKGINSTALL install ca-certificates -y
		fi
	fi
}

update_certs () {
	if has_cmd $UPDATE_CA_CERTS; then
		$UPDATE_CA_CERTS
	fi
}

concat_certs () {
	if [ -d "$SSL_CERTS_DIR" ]; then
		if [ "$USES_YUM" -o "$USES_DNF" ]; then
			rm -f "$CERT_PEM"
			if [ -f "/etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem" ]; then
				ln -s /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem "$CERT_PEM"
			elif [ -f "/etc/pki/tls/certs/ca-bundle.crt" ]; then
				# photon linux
				cat "$CA_DIR"/*.crt >> /etc/pki/tls/certs/ca-bundle.crt
				ln -s /etc/pki/tls/certs/ca-bundle.crt "$CERT_PEM"
			else
				cat "$SSL_CERTS_DIR"/*.pem > "$CERT_PEM"
			fi
		elif [ "$USES_APK" ]; then
			# do nothing
			echo > /dev/null
		else
			cat "$SSL_CERTS_DIR"/*.pem > "$CERT_PEM"
		fi
	fi
}

# java utility to update one cert into the java keystore
_keystore_add () {
	local CRT_FILE="$1"
	local ALIAS=$(basename "$CRT_FILE" | cut -d. -f1)
	keytool -importcert \
		-noprompt -cacerts \
		-trustcacerts \
		-file "$CRT_FILE" \
		-alias "$ALIAS" \
		-storepass "$JKS_PASS"
}

# import all local ca certs into the java keystore
import_jks() {
	local USES_KEYTOOL=$(has_cmd keytool)
	if [ -d "$CA_DIR" -a "$USES_KEYTOOL" ]; then
		for CRT in "$CA_DIR"/*.crt; do
			_keystore_add "$CRT"
		done
	fi
}

USES_APK="$(has_cmd apk)"
USES_APT="$(has_cmd apt-get)"
USES_DNF="$(has_cmd microdnf)"
USES_YUM="$(has_cmd yum)"
PKGINSTALL="$USES_APK$USES_APT$USES_DNF$USES_YUM"

normalize_paths
install
update_certs
concat_certs
import_jks
