FROM ubuntu:latest

MAINTAINER Pablo Almeida "pablo.almeida.galvez@gmail.com"

ENV	DEBIAN_FRONTEND	noninteractive

ENV ORACLE_HOME	/u01/app/oracle/product/12.1.0/xe
ENV ORACLE_SID 	xe

RUN apt-get update && apt-get install libaio1 tar -y && apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* 
RUN ln -s /usr/bin/awk /bin/awk

RUN groupadd --gid 1001 dba && useradd -g dba -m --uid 1001 oracle

VOLUME /u01/app/oracle/product/12.1.0/xe/dbs
VOLUME /u01/app/oracle/oradata

