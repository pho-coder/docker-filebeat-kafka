FROM openjdk:8-jre

MAINTAINER Phoenix Zhang <pho.coderzhang@gmail.com>

ENV KAFKA_VERSION=0.11.0.1 \
    KAFKA_DOWNLOAD_URL=http://apache.website-solution.net \
    FILEBEAT_VERSION=5.6.2 \
    FILEBEAT_DOWNLOAD_URL=https://artifacts.elastic.co/downloads/beats


RUN set -x && \
  apt-get update && \
  apt-get install -y wget && \
  wget ${KAFKA_DOWNLOAD_URL}/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz -O /opt/kafka.tgz && \
  cd /opt && \
  tar -xzf kafka.tgz && \
  wget ${FILEBEAT_DOWNLOAD_URL}/filebeat/filebeat-${FILEBEAT_VERSION}-linux-x86_64.tar.gz -O /opt/filebeat.tar.gz && \
  cd /opt && \
  tar xzvf filebeat.tar.gz

WORKDIR /opt
COPY start.sh /opt
COPY start-kafka.sh /opt
COPY filebeat.yml /opt/filebeat-5.6.2-linux-x86_64
COPY start-filebeat.sh /opt
COPY start-log.sh /opt
COPY start-consumer.sh /opt
