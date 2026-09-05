FROM elasticsearch:8.19.0

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"
ENV discovery.type=single-node
ENV xpack.security.enabled=true
ENV path.repo=/usr/share/elasticsearch/data/snapshot

EXPOSE 9200

# Use the official Elasticsearch entrypoint — it already handles
# volume permissions and keystore initialization correctly.
