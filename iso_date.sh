
iso_zulu_date () {
	date -u +%Y-%m-%dT%H:%M:%SZ $@
}

iso_date () {
	date +%Y-%m-%dT%H:%M:%S%z $@
}
