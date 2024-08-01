FROM registry:3.0.0-beta.1
USER daemon
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD nc -z localhost 5000 || exit 1