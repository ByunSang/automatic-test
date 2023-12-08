MAX_CLIENT=40

while [ $MAX_CLIENT -gt 30 ]
do

docker rm -f http2-client$MAX_CLIENT

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

done
