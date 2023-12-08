MAX_CLIENT=20
while [ $MAX_CLIENT -gt 10 ]
do
echo $MAX_CLIENT

echo -e "services:
  https-client$MAX_CLIENT:
    environment:
      - SERVER_IP1=4.4.$MAX_CLIENT.1
    image: 192.168.83.9:30443/test/ubuntu_base
    command: sh -c "/home/tls_test_server/run_ssl.sh"
    volumes:
      - ./tls_test_client:/home/tls_test_server
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: https-client$MAX_CLIENT
    cap_add:
      - NET_ADMIN
    networks:
      wnet:
        ipv4_address: 3.3.$MAX_CLIENT.1
networks:
  wnet:
    external:
      name: wnet
" > https-client$MAX_CLIENT.yml

docker-compose -f https-client$MAX_CLIENT.yml up -d

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

sleep 0.1

done
