
#----
# get details of the OS release
# common vars are ID, VERSION_ID, NAME, PRETTY_NAME
os_release() {
	if [ $(uname) = "Darwin" ]; then
		sw_vers | sed 's/:[	 ]*/=/g;s/ProductName=\(.*\)$/NAME="\1"/;s/ProductVersion=\(.*\)$/VERSION_ID=\1/;s/BuildVersion=\(.*\)$/BUILD_VERSION="\1"/;1 i\
ID=darwin
'
	else
		cat /etc/*-release
	fi
}
