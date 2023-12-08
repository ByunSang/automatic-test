MAX_CLIENT=30
while [ $MAX_CLIENT -gt 20 ]
do
echo $MAX_CLIENT

echo -e "services:
  ftp-client$MAX_CLIENT:
    environment:
      - BASE_IP=3.3.$MAX_CLIENT.1
      - IP_COUNT=1
      - IP_CIDR=16
      - INTERFACE_NAME=eth0
      - ROUTE_DST=default
      - FTP_SERVER_PORT=21
      - FTP_SERVER_IP=4.4.$MAX_CLIENT.1
    image: 192.168.83.9:30443/test/ftp-client
    command: sh -c \"/entrypoint.sh\"
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: ftp-client$MAX_CLIENT
    networks:
      wnet:
        ipv4_address: 3.3.$MAX_CLIENT.1
networks:
  wnet:
    external:
      name: wnet
" > ftp-client$MAX_CLIENT.yml

docker-compose -f ftp-client$MAX_CLIENT.yml up -d

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

sleep 0.1

done
