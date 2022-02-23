
#----
# returns ISO 8166 formatted Zulu Date
iso_zulu_date () {
	date -u +%Y-%m-%dT%H:%M:%SZ $@
}

#----
# returns ISO 8166 formatted Date
iso_date () {
	date +%Y-%m-%dT%H:%M:%S%z $@
}
