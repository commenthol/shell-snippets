#----
# read a .env file and export all variables to work in the current shell
# execute the command in with copy & paste
dotenv () {
	# export $(cat .env | sed 's/#.*//g' | xargs)
	## ubi does not include xargs
	export $(cat .env | sed 's/#.*//g' | while read xarg; do echo $xarg; done)
}
