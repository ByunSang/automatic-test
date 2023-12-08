MAX_SERVER=10
while [ $MAX_SERVER -gt 0 ]
do
        echo $MAX_SERVER
echo -e "services:
  http-server$MAX_SERVER:
    environment:
      - BASE_IP=4.4.$MAX_SERVER.1
    image: 192.168.83.9:30443/test/http-server
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: http-server$MAX_SERVER
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    networks:
      wnet:
        ipv4_address: 4.4.$MAX_SERVER.1
    cap_add:
      - NET_ADMIN
    ports:
      - \"8080:8080\"
networks:
  wnet:
    external:
      name: wnet
" > http-server$MAX_SERVER.yml

docker-compose -f http-server$MAX_SERVER.yml up -d

MAX_SERVER=$(( $MAX_SERVER -1 ))


sleep 0.1
done

