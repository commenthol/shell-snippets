#!/usr/bin/env sh

CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

NETWORK=host
# NETWORK=bridge

. "$CWD"/../has_cmd.sh

podman=podman
if [ $(has_cmd "$podman") -ne 0 ]; then
	podman=docker
	if [ $(has_cmd "$podman") -ne 0 ]; then
		echo no podman or docker
		exit 1
	fi
fi

run_test_dockerized () {
	local CONTAINER="$1"
	local LOG="$(basename $1 | tr ":" "-")"

	echo "running $CONTAINER"

	$podman run -it --rm \
		--add-host www.aa.aa:127.0.0.1 \
		-e MY_TEST=1 \
		-e LOG=$LOG \
		--hostname nixtest \
		--network=$NETWORK \
		-v "$CWD/..:/snippets" \
		$CONTAINER \
		sh -c "cd /snippets; sh scripts/single-run.sh"
}

run_test_dockerized docker.io/library/alpine:3
run_test_dockerized docker.io/library/debian:bullseye-slim
run_test_dockerized docker.io/library/photon:4.0
run_test_dockerized quay.io/app-sre/ubi8-ubi-minimal:8.7
run_test_dockerized docker.io/library/ubuntu:22.04
"$CWD"/../test_all.sh | tee "$CWD"/../logs/current.log 2>&1
