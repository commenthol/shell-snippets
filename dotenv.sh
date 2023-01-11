#----
# read a .env file and export all variables to work in the current shell
# execute the command in with copy & paste
# NOTE: You'll have to start the script with `.` or `source`
# NOTE: Envvars with spaces are NOT supported
dotenv () {
	export $(sed 's/#.*//g' .env)
}
