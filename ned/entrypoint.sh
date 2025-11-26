#!/bin/bash

ip route del default via 192.168.10.1
ip route add default via 192.168.10.254

# --- INICIAR KEA DHCPV4 ---
# Nota: La configuración principal debe estar disponible en /etc/kea/kea-dhcp4.conf
rm -f /var/run/kea/kea-dhcp4.kea-dhcp4.pid
kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d &

# --- INICIAR KEA DHCP-DDNS (D2) ---
rm -f /var/run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid
kea-dhcp-ddns -c /etc/kea/kea-dhcp-ddns.conf -d &

# Esperar a que los procesos en segundo plano terminen
wait