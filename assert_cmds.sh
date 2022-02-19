
. ./has_cmd.sh

# assert that commands are available on the system
assert_cmds () {
	local NOT_FOUND

	for ARG in "$@" ; do
		if [ $(has_cmd "$ARG") -ne 0 ]; then
			NOT_FOUND="$NOT_FOUND $ARG"
		fi
	done

	if [ "$NOT_FOUND" ]; then
		echo "FATAL: commands not found:$NOT_FOUND" >&2
		exit 1
	fi
}

