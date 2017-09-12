#!/bin/bash

: ${1?"Usage: $0 TEAMCITY_SERVER_ADDR TEAMCITY_AGENT_NAME"}
: ${2?"Usage: $0 TEAMCITY_SERVER_ADDR TEAMCITY_AGENT_NAME"}

TEAMCITY_SERVER=$1
TEAMCITY_AGENT_NAME=$2
TEAMCITY_AGENT_HOME=/opt/teamcity-agent
PORT=9091

# Install requirements
apt-get update && apt-get -y install wget default-jre unzip

mkdir -p ${TEAMCITY_AGENT_HOME}

# Get the agent files from the server
wget -O /tmp/buildAgent.zip ${TEAMCITY_SERVER}/update/buildAgent.zip
unzip /tmp/buildAgent.zip -d ${TEAMCITY_AGENT_HOME}
rm -fR /tmp/*

# Configure the agent
cp ${TEAMCITY_AGENT_HOME}/conf/buildAgent.dist.properties ${TEAMCITY_AGENT_HOME}/conf/buildAgent.properties
sed -i "s|^serverUrl=.*$|serverUrl=${TEAMCITY_SERVER}|" ${TEAMCITY_AGENT_HOME}/conf/buildAgent.properties
sed -i "s|^name=.*$|name=${TEAMCITY_AGENT_NAME}|" ${TEAMCITY_AGENT_HOME}/conf/buildAgent.properties
sed -i "s|authorizationToken=.*$|authorizationToken=\nownPort=${PORT}|" ${TEAMCITY_AGENT_HOME}/conf/buildAgent.properties

mkdir -p ${TEAMCITY_AGENT_HOME}/logs/
touch ${TEAMCITY_AGENT_HOME}/logs/teamcity-agent.log

chmod +x ${TEAMCITY_AGENT_HOME}/bin/*.sh
${TEAMCITY_AGENT_HOME}/bin/agent.sh start
