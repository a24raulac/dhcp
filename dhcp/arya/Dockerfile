FROM debian:13

RUN apt update && \
    apt install -y procps iproute2 dnsutils bind9 bind9utils bind9-doc iputils-ping iproute2 &&\
    rm -rf /var/lib/apt/lists/*

# COPY /bind/named.conf.options /etc/bind/named.conf.options
WORKDIR /etc/bind
# CMD tail -f /dev/null
ENTRYPOINT ["named", "-g", "-4"]