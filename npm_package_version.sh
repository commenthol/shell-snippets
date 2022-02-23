#----
# get the version from a package.json file with sh
npm_package_version() {
	grep '"version":' | head -n 1 | cut -d'"' -f4 | tr -d "[:space:]"
}
