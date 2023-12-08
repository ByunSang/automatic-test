MAX_CLIENT=10

while [ $MAX_CLIENT -gt 0 ]
do

docker rm -f http-client$MAX_CLIENT

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

done
