#!/usr/bin/env bash
export TOPIC_NAME=test
cd /opt/kafka_2.11-*
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > /dev/null 2>&1&
echo "waiting for starting zookeeper..."
sleep 3
nohup bin/kafka-server-start.sh config/server.properties > /dev/null 2>&1&
echo "waiting for starting kafka..."
sleep 3
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic ${TOPIC_NAME}
