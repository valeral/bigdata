#!/bin/bash

echo =============== Starting journal node
hadoop-daemon.sh start journalnode 

echo =============== Sleep 10 sec
sleep 10

echo =============== Starting Zookeeper
zkServer.sh start 

echo =============== Format Namenode data
hdfs namenode -format

echo =============== Starting Namenode
hadoop-daemon.sh start namenode

echo =============== Format ZKFC
hdfs zkfc -formatZK

echo =============== Starting Zookeeper Failover Controller
hdfs zkfc
