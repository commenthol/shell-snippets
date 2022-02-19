#!/usr/bin/env sh

has_cmd () {
	type $1 > /dev/null 2>&1
	test $? -eq 0 && echo $1
}

USES_APK="$(has_cmd apk)"
USES_APT="$(has_cmd apt-get)"
USES_DNF="$(has_cmd microdnf)"
USES_YUM="$(has_cmd yum)"
PKGINSTALL="$USES_APK$USES_APT$USES_DNF$USES_YUM"

$PKGINSTALL update -q

if [ "$USES_APK" ] ; then
	$PKGINSTALL add curl nodejs python3 openjdk11 -q
else
	if [ ! -f /etc/localtime ]; then
		# prevent configuration of timezone
		export TZ=Europe/Kiev
		ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
	fi

	$PKGINSTALL install curl nodejs python3 python3-pip -y
	if [ "$USES_APT" ]; then
		$PKGINSTALL install openjdk-11-jre-headless -y
	else
		# photon
		$PKGINSTALL install openjdk11 -y
		# ubi
		$PKGINSTALL install java-11-openjdk-headless -y
	fi
fi
