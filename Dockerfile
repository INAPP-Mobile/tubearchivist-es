FROM elasticsearch:8.19.0

USER root

# Remove stale lock that survived volume detach before delegating to the
# upstream entrypoint (which switches to elasticsearch user internally).
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENV ES_JAVA_OPTS="-Xms512m -Xmx512m"
ENV discovery.type=single-node
ENV xpack.security.enabled=true
ENV path.repo=/usr/share/elasticsearch/data/snapshot

EXPOSE 9200

ENTRYPOINT ["/docker-entrypoint.sh"]
