# trunk-ignore-all(trivy/DS001)
# trunk-ignore(checkov/CKV_DOCKER_7)
# trunk-ignore(hadolint/DL3007)
FROM beevelop/sonarlint:latest
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "sonarlint --version || exit 1" ]
USER daemon