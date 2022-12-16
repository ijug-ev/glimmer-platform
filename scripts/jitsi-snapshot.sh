SERVERID=$(hcloud server list -o columns=id,name|grep jitsi-meet|cut -d" " -f1)

if [ -z "$SERVERID" ]; then
 echo Server jitsi-meet nicht gefunden, breche ab.
 exit 1
else
 echo Server jitsi-meet hat die ID $SERVERID
fi

hcloud server create-image --description "Jitsi-Meet letzter Stand `date -I`" --type snapshot --label "version=current,app=jitsi" jitsi-meet
