#!/usr/bin/env sh

. ./npm_package_version.sh

json=$(cat <<EOS
{
	"name": "my",
	"version": "1.2.3-4",
	"description": "test"
}
EOS
)

echo "$json" | npm_package_version
echo
