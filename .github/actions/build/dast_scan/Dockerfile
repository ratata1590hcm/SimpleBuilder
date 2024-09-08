# trunk-ignore-all(hadolint/DL3007)
# trunk-ignore-all(checkov/CKV_DOCKER_7)
# trunk-ignore(trivy/DS001)
FROM soosio/dast:latest
USER daemon
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "bash || exit 1" ]