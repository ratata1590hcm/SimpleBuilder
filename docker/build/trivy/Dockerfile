FROM aquasec/trivy:0.54.0
USER root
COPY packages.txt /tmp/
RUN apk update && \
    xargs -a /tmp/packages.txt apk add --no-cache && \
    apk upgrade && \
    rm -rf /var/cache/apk/* /tmp/packages.txt
RUN TRIVY_SKIP_DB_UPDATE=false trivy --quiet image --download-db-only
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "docker --version || exit 1" ]
USER daemon