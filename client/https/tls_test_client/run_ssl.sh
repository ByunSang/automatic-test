#!/bin/bash

#for debug
#export SSLKEYLOGFILE="/home/tls_test_server/sslkey.log"

while [ 1 ]

do
curl -i -X POST --form upload_file=@/home/tls_test_server/dummy --form submit=upload https://$SERVER_IP1/files/dummy --insecure --http1.1

sleep 0.1

done
