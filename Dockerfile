# syntax=docker/dockerfile:labs
FROM alpine:3.20.2
COPY --from=zoeyvid/curl-quic:410 /usr/local/bin/curl /usr/local/bin/curl
COPY update.sh /usr/local/bin/update.sh
COPY healthcheck.sh /usr/local/bin/healthcheck.sh
RUN apk upgrade --no-cache -a && \
    apk add --no-cache ca-certificates tzdata tini jq && \
    chmod -R 777 /tmp

ENV UI=5m

USER nobody
ENTRYPOINT ["tini", "--", "update.sh"]
HEALTHCHECK CMD healthcheck.sh || exit 1
