
#----
# check if command is available on the system
has_cmd () {
	type $1 > /dev/null 2>&1
	echo $?
}
