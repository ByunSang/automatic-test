MAX_CLIENT=20

while [ $MAX_CLIENT -gt 10 ]
do

docker rm -f https-client$MAX_CLIENT

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

done
