FROM bitnami/kafka:3.4.1

# Copy Debezium source connector plugin files
COPY ./connectors/debezium-connector-postgres /opt/connectors/debezium-connector-postgres

# Copy Camel sink connector plugin files
COPY ./connectors/camel-aws-ddb-sink-kafka-connector /opt/connectors/camel-aws-ddb-sink-kafka-connector

# Copy Connect instance configuration file
COPY ./connect-distributed.properties /opt/bitnami/kafka/config/connect-distributed.properties

# Start Kafka Connect instance in distributed mode with configuration file
CMD ["/opt/bitnami/kafka/bin/connect-distributed.sh", "/opt/bitnami/kafka/config/connect-distributed.properties"]
