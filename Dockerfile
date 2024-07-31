FROM ubuntu:22.04
USER ubuntu
RUN apt-get update && apt-get install -yqq --no-install-recommends btop=latest && apt-get clean && rm -rf /var/lib/apt/lists/*
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]