
TIMEOUT=1s

#----
# a http get request
# @param {string} HOSTNAME
# @param {number} [PORT=80]
# @param {string} [PATHNAME="/"]
http_get () {
	local _2=$2
	local _3=$3
	local _HOSTNAME="$1"
	local _PORT="${_2:=80}"
	local _PATHNAME="${_3:=/}"

	CMD=$(cat <<EOS
true
exec 3<>/dev/tcp/${_HOSTNAME}/${_PORT}
echo -e "GET ${_PATHNAME} HTTP/1.1\r\nHost: ${_HOSTNAME}\r\nConnection: close\r\n\r\n" >&3
cat <&3
EOS
)
	timeout $TIMEOUT bash -c "$CMD"
}

#----
# tcp connect to cehck connnectivity
# @param {string} HOSTNAME
# @param {number} [PORT=80]
tcp_connect () {
	local _2=$2
	local _HOSTNAME="$1"
	local _PORT="${_2:=80}"

	CMD=$(cat <<EOS
true
exec <>/dev/tcp/${_HOSTNAME}/${_PORT}
EOS
)
	timeout $TIMEOUT bash -c "$CMD"
}
