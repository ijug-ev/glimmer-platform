#!/bin/bash
IMAGEID=$(hcloud image list -l "version=current,app=jitsi" -o columns=id | tail -1)
# --datacenter fsn1-dc14 \
# for now NBG datacenter because primary IPs are located there
hcloud server create \
 --name jitsi-meet \
 --image $IMAGEID \
 --type cpx31 \
 --datacenter nbg1-dc3 \
 --ssh-key tobias@ijug,markus@Turbomaus,marcus@fihlon.swiss \
 --primary-ipv4 primary_ip-meet-ijug-eu-ipv4 \
 --primary-ipv6 primary_ip-meet-ijug-eu-ipv6
