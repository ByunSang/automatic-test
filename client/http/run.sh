MAX_CLIENT=10
while [ $MAX_CLIENT -gt 0 ]
do
echo $MAX_CLIENT

echo -e "services:
  http-client$MAX_CLIENT:
    environment:
      - BASE_IP=4.4.$MAX_CLIENT.1
    image: 192.168.83.9:30443/test/http-client
    command: sh -c \"/home/ip.sh\"
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: http-client$MAX_CLIENT
    networks:
      wnet:
        ipv4_address: 3.3.$MAX_CLIENT.1
networks:
  wnet:
    external:
      name: wnet
" > http-client$MAX_CLIENT.yml

docker-compose -f http-client$MAX_CLIENT.yml up -d

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

sleep 0.1

done
