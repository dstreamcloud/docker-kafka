#!/bin/sh -e

export INDEX=${HOSTNAME##*-}
export BROKER_ID="broker.id=$INDEX"
export KAFKA_ADVERTISED_LISTENERS="advertised.listeners=PLAINTEXT://$(hostname -f):9092"

sed -i -e "s/broker.id=0/$BROKER_ID/g" /opt/kafka/config/server.properties
sed -i -e "s/advertised.listeners=KAFKA_ADVERTISED_LISTENERS/$KAFKA_ADVERTISED_LISTENERS/g" /opt/kafka/config/server.properties

/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
