#!/usr/bin/env sh

. ./cwd.sh

all () {
	for FILE in "$CWD"/*.test.sh ; do
		file=$(basename "$FILE")
		if [ $file != "update_certificates.test.sh" ]; then
			echo "=== "$file" ==="
			sh "$FILE"
		fi
	done
}

all
# sh "./update_certificates.test.sh"

## single tests
# sh "./to_lower_case.test.sh"

