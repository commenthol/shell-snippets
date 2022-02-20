#!/usr/bin/env bash

####
# a poor mans cron job for daily tasks only
# in case you need a simple solution to run scheduled tasks without setting up a cron daemon and job

# add the times you'd like to schedule fcmd
times=(8:00 13:00 23:00)

# your commands
fcmd() {
	# add your commands here
	echo "execute your commands here"
}

# now date
fnow () {
	echo $(date +%s)
}

# calculates the seconds till next schedule
fnext_sleep () {
	local now=$(fnow)
	local next=100000

	for time in ${times[@]} ; do
		local nexttimes=($(date +%s -d "$time") $(date +%s -d "$time 1 day"))

		for nexttime in ${nexttimes[@]} ; do
			local d=$(expr $nexttime - $now)
			if [ $d -gt 0 ] ; then
				if [ $d -lt $next ]; then
					next=$d
				fi
			fi
		done
	done
	echo $next
}

# our endless loop
while : ; do
	fcmd
	next=$(fnext_sleep)
	time=$(date +"%Y-%m-%d %H:%M" -d @$(expr $(fnow) + $next))
	echo ... sleeping $next seconds until $time
	sleep $next
done
