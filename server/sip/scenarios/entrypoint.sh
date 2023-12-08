echo "; client1 peer 
[sipp]
type=peer
username=sippuac
host=$CLIENT_IP ; sip client1 ip
port=5065
context=sipptest
dtmfmode=rfc2833
insecure=very
canreinvite=no
nat=yes
quality=no
 
; client2 peer
[sippuas]
type=peer
username=sippuas
host=$SERVER_IP ; sip client2 ip
port=5067
context=sipptest
dtmfmode=rfc2833
insecure=very
canreinvite=no
nat=yes
quality=no
" >> /etc/asterisk/sip.conf

echo "[sipptest]
exten=s,1,Dial(SIP/sippuas,20)" >> /etc/asterisk/extensions.conf

sipp -sf home/scenarios/sipp-scenarios-master/sipp_uas_basic.xml -p 5060 -mp 6003 -i $SERVER_IP -nr
