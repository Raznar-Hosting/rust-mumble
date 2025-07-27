#!/bin/sh

exec /rust-mumble \
  --listen "${LISTEN:-0.0.0.0:64738}" \
  --http-listen "${HTTP_LISTEN:-0.0.0.0:8080}" \
  --http-user "${HTTP_USER:-admin}" \
  ${HTTP_PASSWORD:+--http-password "$HTTP_PASSWORD"} \
  ${HTTPS:+--https} \
  ${HTTP_LOG:+--http-log} \
  --key "${KEY:-key.pem}" \
  --cert "${CERT:-cert.pem}" \
  ${RESTRICT_TO_VERSION:+--restrict-to-version "$RESTRICT_TO_VERSION"} \
  --max-clients "${MAX_CLIENTS:-32}"
