FROM alpine:3.20.2
USER root
COPY packages.txt /tmp/
RUN apk update && \
    xargs -a /tmp/packages.txt apk add --no-cache && \
    apk upgrade && \
    rm -rf /var/cache/apk/* /tmp/packages.txt
USER daemon
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]