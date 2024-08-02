FROM maven:amazoncorretto
USER daemon
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "mvn", "-v" ]