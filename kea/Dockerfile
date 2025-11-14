FROM debian:13
RUN apt-get update && apt-get install -y curl
RUN curl -1sLf \
  'https://dl.cloudsmith.io/public/isc/kea-3-0/setup.deb.sh' \
  | bash
RUN apt-get update && apt-get install -y \
        procps \
        iproute2 \
        iputils-ping \
        dnsutils \
        tcpdump \
        rsyslog \        
        isc-kea-dhcp4 \
        isc-kea-admin \
        isc-kea-ctrl-agent \
        isc-kea-dhcp-ddns \
        && rm -rf /var/lib/apt/lists/*

# COPY kea-dhcp4.conf.json /etc   /kea/kea-dhcp4.conf

RUN mkdir -p /run/kea /var/run/kea /var/lib/kea && \
    touch /var/lib/kea/kea-leases4.csv && \
    chmod -R 777 /run/kea /var/run/kea /var/lib/kea


RUN sed -i 's/^\s*module(load="imklog")/#module(load="imklog")/' /etc/rsyslog.conf

#CMD ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf", "-d"]

# CMD tail -f /dev/null