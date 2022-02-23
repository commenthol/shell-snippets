
#----
# get details of the OS release
# common vars are ID, VERSION_ID, NAME, PRETTY_NAME
os_release() {
	cat /etc/*-release
}
