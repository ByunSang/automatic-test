MAX_SERVER=50
while [ $MAX_SERVER -gt 40 ]
do
        echo $MAX_SERVER
echo -e "services:
  sip-server$MAX_SERVER:
    environment:
      - SERVER_IP=4.4.$MAX_SERVER.1
      - CLIENT_IP=3.3.$MAX_SERVER.1
    image: 192.168.83.9:30443/test/ubuntu_base
    volumes:
      - ./scenarios:/home/scenarios
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: sip-server$MAX_SERVER
    networks:
      wnet:
        ipv4_address: 4.4.$MAX_SERVER.1
    cap_add:
      - NET_ADMIN
    ports:
      - \"5060:5060/udp\"
    entrypoint: sh -c \"/home/scenarios/entrypoint.sh\"
networks:
  wnet:
    external:
      name: wnet
" > sip-server$MAX_SERVER.yml

docker-compose -f sip-server$MAX_SERVER.yml up -d

MAX_SERVER=$(( $MAX_SERVER -1 ))


sleep 0.1
done

