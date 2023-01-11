#!/usr/bin/env sh

. ./ip_from_hostname.sh

for host in www.duck.com this.is-not.there eff.org
do
	IP=$(ip_from_hostname "$host")
	echo $IP
	if [ $IP ]
	then
		echo found $host $IP
	fi
done

