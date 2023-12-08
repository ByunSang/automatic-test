MAX_CLIENT=50
while [ $MAX_CLIENT -gt 40 ]
do
echo $MAX_CLIENT

echo -e "services:
  sip-client$MAX_CLIENT:
    environment:
      - SERVER_IP1=4.4.$MAX_CLIENT.1
    image: 192.168.83.9:30443/test/ubuntu_base
    volumes:
      - ./scenarios:/home/scenarios
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: sip-client$MAX_CLIENT
    cap_add:
      - NET_ADMIN
    networks:
      wnet:
        ipv4_address: 3.3.$MAX_CLIENT.1
    ports:
      - \"5060:5060/udp\"
    command: \"sipp -s s -sf /home/scenarios/sipp-scenarios-master/sipp_uac_basic.xml -p 5060 -i 3.3.$MAX_CLIENT.1 4.4.$MAX_CLIENT.1 -nr -rp 1000\"
networks:
  wnet:
    external:
      name: wnet
" > sip-client$MAX_CLIENT.yml

docker-compose -f sip-client$MAX_CLIENT.yml up -d

MAX_CLIENT=$(( $MAX_CLIENT -1 ))

sleep 0.1

done
