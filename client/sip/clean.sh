MAX_CLIENT=50

while [ $MAX_CLIENT -gt 40 ]
do

docker rm -f sip-client$MAX_CLIENT

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

done
