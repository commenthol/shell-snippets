#----
# read a .env file and export all variables to work in the current shell
# execute the command in with copy & paste
dotenv () {
	export $(cat .env | sed 's/#.*//g' | xargs)
}
