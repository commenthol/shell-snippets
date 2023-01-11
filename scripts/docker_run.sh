#!/usr/bin/env sh

CWD=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
# CONTAINER=docker.io/library/alpine:3
# CONTAINER=docker.io/library/debian:bullseye-slim
# CONTAINER=docker.io/library/photon:4.0
CONTAINER=quay.io/app-sre/ubi8-ubi-minimal:8.5-230

. "$CWD"/../has_cmd.sh

podman=podman
if [ $(has_cmd "$podman") -ne 0 ]; then
	podman=docker
	if [ $(has_cmd "$podman") -ne 0 ]; then
		echo no podman or docker
		exit 1
	fi
fi

$podman run -it --rm \
	--add-host www.aa.aa:127.0.0.1 \
	--network=host \
	-v "$CWD/..:/snippets" \
	$CONTAINER \
	sh
