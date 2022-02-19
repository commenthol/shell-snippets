
# get an ip from a hostname
# NOTE: Always is "match" on alpine busybox
# NOTE: debian needs `apt install net-tools``
ip_from_hostname () {
	local _R="$(arp "$1" 2>/dev/null)"
	if [ $? -eq 0 ]; then
		echo "$_R" | cut -d" " -f2 | sed "s#[()]##g;"
	fi
}
