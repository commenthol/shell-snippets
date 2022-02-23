#!/usr/bin/env sh

CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

NETWORK=host
# NETWORK=bridge

. ./assert_cmds.sh

run_test_dockerized () {
	local CONTAINER="$1"
	local LOG="$(basename $1 | tr ":" "-")"

	echo "running $CONTAINER"

	podman run -it --rm \
		--add-host www.aa.aa:127.0.0.1 \
		--hostname nixtest \
		--network=$NETWORK \
		-v "$CWD/..:/snippets" \
		$CONTAINER \
		sh -c "cd /snippets; sh test_all.sh" | tee "$CWD/../logs/$LOG.log" 2>&1
}

assert_cmds podman
run_test_dockerized docker.io/library/alpine:3
run_test_dockerized docker.io/library/debian:bullseye-slim
run_test_dockerized docker.io/library/photon:4.0
run_test_dockerized quay.io/app-sre/ubi8-ubi-minimal:8.5-230
run_test_dockerized docker.io/library/ubuntu:22.04
