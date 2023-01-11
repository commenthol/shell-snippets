. ./has_cmd.sh

if [ $(has_cmd apk) -eq 0 ]; then
	USES_APK=1
	PACKAGE_TOOL=apk
elif [ $(has_cmd apt-get) -eq 0 ]; then
	USES_APT=1
	PACKAGE_TOOL=apt-get
elif [ $(has_cmd microdnf) -eq 0 ]; then
	USES_DNF=1
	PACKAGE_TOOL=microdnf
elif [ $(has_cmd yum) -eq 0 ]; then
	USES_YUM=1
	PACKAGE_TOOL=yum
fi

package_tool() {
	echo "$PACKAGE_TOOL"
}

package_update() {
	if [ $USES_APK ]; then
		$PACKAGE_TOOL update -q
	else
		$PACKAGE_TOOL update -q -y
	fi
}

package_install() {
	if [ $USES_APK ]; then
		$PACKAGE_TOOL add $@
	else
		$PACKAGE_TOOL install -y $@
	fi
}
