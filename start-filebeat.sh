#!/usr/bin/env bash
echo "waiting for starting filebeat..."
cd /opt/filebeat-*
nohup ./filebeat -c filebeat.yml > /dev/null 2>&1&
sleep 3
