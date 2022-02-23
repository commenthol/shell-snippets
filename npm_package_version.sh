#----
# get the version from a package.json file with sh
npm_package_version() {
	grep '"version":' | cut -d'"' -f4 | tr -d "[:space:]"
}
