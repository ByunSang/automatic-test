MAX_CLIENT=30

while [ $MAX_CLIENT -gt 20 ]
do

docker rm -f ftp-client$MAX_CLIENT

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

done
