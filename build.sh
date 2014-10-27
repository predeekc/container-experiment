#!/bin/bash

function pingPrivateRegistry {
	echo " -Pinging private docker registry..."
	PING_RESULT=$(curl -s -m 5 172.17.8.210:5000/v1/_ping)	
	echo $PING_RESULT
	if [ "${PING_RESULT}" == "true" ]
	then
		return 0 #OK
	else
		return 1 #error
	fi
}

docker build -t 172.17.8.210:5000/load-balancer ./load-balancer
docker build -t 172.17.8.210:5000/web ./web

echo "Uploading images to private docker registry"

# Wait for the private docker registry to respond
NEXT_WAIT_TIME=0
until [ $NEXT_WAIT_TIME -eq 100 ] || pingPrivateRegistry; do
   	sleep $(( NEXT_WAIT_TIME++ ))
done

if [ $NEXT_WAIT_TIME -eq 100 ]
then
	echo "Registry not found."
else
	docker push 172.17.8.210:5000/load-balancer
	docker push 172.17.8.210:5000/web	
fi

