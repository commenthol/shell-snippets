#----
# a simple argument parser without getopts
while [ $1 ]; do
	case $1 in
	-h|--help)
		cat <<-EOS
		add help text here
		EOS
		# print script content
		# cat $0
		exit 0
		;;
	-v|--version)
		echo 1.0.0
		exit 0
		;;
	*)
		echo $1
		;;
	esac
	shift
done
