# ipv64-updater

A docker image to use push healthchecks of uptime kuma, just use this compose file:

```yaml
services:
  kuma-push:
    container_name: kuma-push
    image: zoeyvid/kuma-push
    restart: always
    network_mode: bridge
    environment:
      - "TZ=Europe/Berlin"                                   # your timezone
      - "URL=https://status.example.org/api/push/E5JOgXP8rK" # your uptime kuma push URL
#      - "UI=5m"                                             # interval to update DDNS
```

you need to change the URL
