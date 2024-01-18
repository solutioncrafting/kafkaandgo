FROM confluentinc/cp-kafka:7.3.2
EXPOSE 9092

CMD ["kafka-server-start.sh", "server.properties"]
