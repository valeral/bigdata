#!/bin/bash

echo =============== Starting journal node
hadoop-daemon.sh start journalnode 

echo =============== Sleep 30 sec
sleep 30

echo =============== Starting Zookeeper
zkServer.sh start 

echo =============== Starting Datanode
hdfs datanode
