#----
# Log json output from sh, bash with different log levels

iso_date () {
	date +%Y-%m-%dT%H:%M:%S%z $@
}

#----
# escape a json string
# works with `sh` on
# - alpine, photon, ubi
# where `bash` is needed for
# - debian, ubuntu
escape_json () {
	local message="${1//'\n'/'\'n}"
	message=${message//'"'/'\"'}
	message=${message//'\r'/'\'r}
	message=${message//'\t'/'\'t}
	message=${message//'\b'/'\'b}
	echo "$message"
}

#----
# alternative which requires perl
escape_json_sh () {
	echo "$1" | perl -pe 's/\n/\\\\n/g;s/\r/\\\\r/g;s/\t/\\\\t/g;s/"/\\"/g;' | perl -pe 's/\\\\n$//;'
}

#----
# generic json logger
log_json () {
	local level="$1"
	# local message=$(escape_json_sh "$2")
	local message=$(escape_json "$2")
	local timestamp=$(iso_date)
	echo "{\"level\":\"$level\",\"msg\":\"$message\",\"time:\":\"$timestamp\"}"
}
log_debug () {
	log_json DEBUG "$1"
}
log_info () {
	log_json INFO "$1"
}
log_warn () {
	log_json WARN "$1"
}
log_error () {
	log_json ERROR "$1"
}
log_fatal () {
	log_json FATAL "$1"
}
