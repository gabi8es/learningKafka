@echo off
start  bin\windows\zookeeper-server-start.bat config/zookeeper.properties
timeout 5


@echo off
start  bin\windows\kafka-server-start.bat config/server.properties
timeout 5

@echo off
REM  start bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic user
REM  start bin\windows\kafka-topics.bat --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic account


@echo off
start bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic user --from-beginning
start bin\windows\kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic account
timeout 5


@echo off
start  bin\windows\kafka-console-producer.bat --broker-list localhost:9092 --topic user
start  bin\windows\kafka-console-producer.bat --broker-list localhost:9092 --topic account