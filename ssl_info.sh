
ssl_info () {
	local hostname=$1
	local port=$2
	if [ -z $port ]; then
		port=443
	fi
	echo | openssl s_client -connect $hostname:$port $3
}

# 0 = true ssl-cert is valid
# 1 = false ssl-cert is not valid
ssl_is_valid () {
	local hostname=$1
	local port=$2
	if [ -z $port ]; then
		port=443
	fi
	echo | openssl s_client -connect $hostname:$port -brief 2>&1 | grep "Verification: OK" > /dev/null
	echo $?
}

ssl_dates () {
	local hostname=$1
	local port=$2
	if [ -z $port ]; then
		port=443
	fi
	echo | openssl s_client -connect $hostname:$port 2>/dev/null | openssl x509 -noout -dates
}
