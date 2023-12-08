MAX_SERVER=20
while [ $MAX_SERVER -gt 10 ]
do
        echo $MAX_SERVER
echo -e "services:
  https-server$MAX_SERVER:
    environment:
      - BASE_IP=4.4.$MAX_SERVER.1
    image: 192.168.83.9:30443/test/ubuntu_base
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: https-server$MAX_SERVER
    volumes:
      - ./tls_test_server:/home/tls_test_server
    entrypoint: "/home/tls_test_server/tls_test_server -k /home/tls_test_server/server.key -c /home/tls_test_server/server.crt"
    networks:
      wnet:
        ipv4_address: 4.4.$MAX_SERVER.1
    cap_add:
      - NET_ADMIN
networks:
  wnet:
    external:
      name: wnet
" > https-server$MAX_SERVER.yml

docker-compose -f https-server$MAX_SERVER.yml up -d

MAX_SERVER=$(( $MAX_SERVER -1 ))


sleep 0.1
done

