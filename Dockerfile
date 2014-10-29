FROM debian:wheezy

ADD files/backports.list /etc/apt/sources.list.d/backports.list
RUN apt-get update && apt-get install -y curl haproxy gawk && sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && rm -rf /var/lib/apt/lists/*
ADD ./files/haproxy.cfg /etc/haproxy/haproxy.cfg

ADD ./files/haproxy_dns_cfg /usr/local/bin/haproxy_dns_cfg
ADD ./files/discovery_start /usr/local/bin/discovery_start

ENV HAPROXY_HOST 127.0.0.1
ENV RELOAD_TTL 60
ENV DISCOVERY_URL localhost:8081

CMD ["discovery_start"]
