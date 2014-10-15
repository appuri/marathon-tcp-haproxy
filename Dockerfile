FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y curl haproxy && sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy
ADD ./files/haproxy.cfg /etc/haproxy/haproxy.cfg

ADD ./files/haproxy_dns_cfg /usr/local/bin/haproxy_dns_cfg
ADD ./files/discovery_start /usr/local/bin/discovery_start

ENV HAPROXY_HOST 127.0.0.1
ENV RELOAD_TTL 60
ENV DISCOVERY_URL localhost:8080

CMD ["discovery_start"]
