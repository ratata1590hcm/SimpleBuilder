FROM sonarsource/sonar-scanner-cli:11.0.0.1541_6.1.0
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "sonar-scanner --version || exit 1" ]
USER daemon