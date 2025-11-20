#!/bin/bash

ip route del default via 192.168.10.1
ip route add default via 192.168.10.254
rm -f /var/run/kea/kea-dhcp4.kea-dhcp4.pid

kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d