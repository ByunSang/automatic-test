MAX_SERVER=10
while [ $MAX_SERVER -gt 0 ]
do
        echo $MAX_SERVER
docker rm -f http-server$MAX_SERVER

MAX_SERVER=$(( $MAX_SERVER -1 ))

sleep 0.1
done

