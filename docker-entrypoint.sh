#!/bin/bash
set -e

# Remove stale lock that survived volume detach
rm -f /usr/share/elasticsearch/data/.lock 2>/dev/null || true
chown -R 1000:1000 /usr/share/elasticsearch/data 2>/dev/null || true

# Delegate to upstream entrypoint as elasticsearch user (uid 1000)
exec runuser -u elasticsearch -- /usr/local/bin/docker-entrypoint.sh "$@"
