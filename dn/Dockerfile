FROM centos:7

RUN yum -y install wget which java-1.8.0-openjdk

RUN wget -P /tmp https://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN tar -xvf /tmp/zookeeper-3.4.6.tar.gz -C /opt
RUN wget -P /tmp https://archive.apache.org/dist/hadoop/core/hadoop-2.6.0/hadoop-2.6.0.tar.gz
RUN tar -xvf /tmp/hadoop-2.6.0.tar.gz -C /opt

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0
ENV HADOOP_HOME=/opt/hadoop-2.6.0
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV YARN_HOME=$HADOOP_HOME
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV ZOOKEEPER_HOME=/opt/zookeeper-3.4.6
ENV PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$ZOOKEEPER_HOME/bin

COPY core-site.xml $HADOOP_HOME/etc/hadoop
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop
COPY zoo.cfg $ZOOKEEPER_HOME/conf

RUN mkdir -p /hadoop-data/jn
RUN mkdir -p /hadoop-data/namenode
RUN mkdir -p /hadoop-data/datanode
RUN mkdir -p /hadoop-data/zookeeper

COPY myid /hadoop-data/zookeeper

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 8485 2181 50075 50020 50010

ENTRYPOINT ["/entrypoint.sh"]
