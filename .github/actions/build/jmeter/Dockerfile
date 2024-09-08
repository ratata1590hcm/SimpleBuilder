FROM vulhub/jmeter:3.3
USER daemon
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]