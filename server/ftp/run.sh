MAX_SERVER=30
while [ $MAX_SERVER -gt 20 ]
do
        echo $MAX_SERVER
echo -e "services:
  ftps-server$MAX_SERVER:
    environment:
      - BASE_IP=4.4.$MAX_SERVER.1
      - INTERFACE_NAME=eth0
      - FTP_SERVER_PORT=21
      - IP=4.4.$MAX_SERVER.1
    networks:
      wnet:
        ipv4_address: 4.4.$MAX_SERVER.1
    #entrypoint: /entrypoint.sh
    image: 192.168.83.9:30443/test/ftpd-server
    stdin_open: true
    tty: true
    restart: always
    privileged: true
    container_name: ftps-server$MAX_SERVER
networks:
  wnet:
    external:
      name: wnet
" > ftps-server$MAX_SERVER.yml

/usr/local/bin/docker-compose -f ftps-server$MAX_SERVER.yml up -d

MAX_SERVER=$(( $MAX_SERVER -1 ))


sleep 0.1
done

