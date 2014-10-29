# Haproxy as tcp proxy for marathon

This is dockerized version of haproxy for marathon.

Haproxy allows you to allocate port number in marathon and
autmatically proxy all connections to your port on loopback
interface to instances running anywhere on mesos.

It is a good idea to run this on every mesos slave.

## Usage

```
docker run -d --net=bridge -e RELOAD_TTL=10 quay.io/appuri/marathon-tcp-haproxy
```

Here `RELOAD_TTL` is interval to check marathon for new port mappings
and `DISCOVERY_PORT` is marathon port to connect to.
and `DISCOVERY_HOST` is marathon host to connect to.


`HAPROXY_HOST` is derived from /etc/ip value, this file with host port must be available in container
