if [ -z $1 ] ; then
	echo Missing steam key: $0 {steam_key}
	exit -1
fi

docker build -t screepsdocker:latest --build-arg steam_api_key=$1 .
