FROM alpine:3.20.2 AS cache
USER root
COPY packages.txt /tmp/
RUN apk update && \
    xargs -a /tmp/packages.txt apk add --no-cache && \
    apk upgrade && \
    rm -rf /var/cache/apk/* /tmp/packages.txt
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]
USER daemon

FROM scratch
COPY --from=cache / /