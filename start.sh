#!/usr/bin/env bash
./start-kafka.sh
./start-filebeat.sh
echo "start to log data..."
nohup ./start-log.sh > /dev/null 2>&1&
./start-consumer.sh
