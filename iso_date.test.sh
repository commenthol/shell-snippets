#!/usr/bin/env sh

. ./iso_date.sh

# get local date
# NOTE: Always UTC on alpine busybox
date
iso_date
iso_zulu_date

# Convert seconds since the epoch (1970-01-01 UTC) to a date
iso_date --date='@2147483647'
iso_zulu_date --date='@2147483647'

# use adifferent time zone
# NOTE: does not work on alpine busybox
iso_date --date='TZ="America/Los_Angeles"'
iso_zulu_date --date='TZ="America/Los_Angeles"'

# explicitly set a time zone
export TZ=Asia/Tokyo

date
iso_date
iso_zulu_date
