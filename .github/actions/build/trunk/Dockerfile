# trunk-ignore-all(checkov/CKV_DOCKER_3)
# trunk-ignore-all(trivy/DS002)
FROM ubuntu:22.04
COPY packages.txt /tmp/
RUN apt-get update && \
    xargs -a /tmp/packages.txt apt-get install -yqq --no-install-recommends && \
    update-ca-certificates && \
    apt-get upgrade -yqq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/packages.txt
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl https://get.trunk.io -fsSL | bash -s -- -y && \
    chmod -R 777 /usr/local/bin/* && \
    mkdir -p /usr/sbin/.cache && \
    chmod -R 777 /usr/sbin/.cache
ENTRYPOINT [ "bash" ]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]