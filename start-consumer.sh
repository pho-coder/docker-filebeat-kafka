#!/usr/bin/env bash
echo "start to consumer data..."
cd /opt/kafka_2.11-*
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
