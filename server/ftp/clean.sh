MAX_SERVER=30
while [ $MAX_SERVER -gt 20 ]
do
        echo $MAX_SERVER
docker rm -f ftps-server$MAX_SERVER

MAX_SERVER=$(( $MAX_SERVER -1 ))

sleep 0.1
done

