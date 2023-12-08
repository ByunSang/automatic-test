MAX_SERVER=50
while [ $MAX_SERVER -gt 40 ]
do
        echo $MAX_SERVER
docker rm -f sip-server$MAX_SERVER

MAX_SERVER=$(( $MAX_SERVER -1 ))

sleep 0.1
done

