
#----
# check if command is available on the system
# 0 = true; 1 = false
has_cmd () {
	type $1 > /dev/null 2>&1
	echo $?
}
