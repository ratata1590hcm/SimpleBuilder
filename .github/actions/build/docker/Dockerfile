FROM docker:27.1.1
USER root
COPY packages.txt /tmp/
RUN apk update && \
    xargs -a /tmp/packages.txt apk add --no-cache && \
    apk upgrade && \
    rm -rf /var/cache/apk/* /tmp/packages.txt
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "docker --version || exit 1" ]
USER daemon