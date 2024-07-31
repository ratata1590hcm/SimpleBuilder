FROM ubuntu:22.04
USER root
COPY packages.txt /tmp/
RUN apt-get update && \
    xargs -a /tmp/packages.txt apt-get install -yqq --no-install-recommends && \
    update-ca-certificates && \
    apt-get upgrade && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/packages.txt
USER daemon
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]