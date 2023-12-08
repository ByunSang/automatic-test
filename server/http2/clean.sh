MAX_SERVER=20
while [ $MAX_SERVER -gt 10 ]
do
        echo $MAX_SERVER
docker rm -f http2-server$MAX_SERVER

MAX_SERVER=$(( $MAX_SERVER -1 ))

sleep 0.1
done

