#!/bin/bash

echo =============== Starting journal node
hadoop-daemon.sh start journalnode 

echo =============== Sleep 20 sec
sleep 20

echo =============== Starting Zookeeper
zkServer.sh start

echo =============== Bootstrap StandBy namenode
hdfs namenode -bootstrapStandby

echo =============== Starting Namenode
hadoop-daemon.sh start  namenode

echo =============== Starting Zookeeper Failover Controller
hdfs zkfc

