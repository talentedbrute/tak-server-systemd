#!/bin/bash

if [ $(id -u) -ne 0 ];
then
  printf "This script must be run as root\n"
  exit
fi
printf "Removing stock startup scripts..."
rm -f /etc/rc.d/init.d/takserver*
printf "DONE\n"

printf "Setting up tak server environment file..."
. /opt/tak/setenv.sh

CONF_FILE="/opt/tak/takserver.conf"
echo "JDK_JAVA_OPTIONS=$JDK_JAVA_OPTIONS" > ${CONF_FILE}
echo "IGNITE_HOME=$IGNITE_HOME" >> ${CONF_FILE}
echo "TOTALRAMBYTES=$TOTALRAMBYTES" >> ${CONF_FILE}
echo "CONFIG_MAX_HEAP=$CONFIG_MAX_HEAP" >> ${CONF_FILE}
echo "API_MAX_HEAP=$API_MAX_HEAP" >> ${CONF_FILE}
echo "MESSAGING_MAX_HEAP=$MESSAGING_MAX_HEAP" >> ${CONF_FILE}
echo "PLUGIN_MANAGER_MAX_HEAP=$PLUGIN_MANAGER_MAX_HEAP" >> ${CONF_FILE}
echo "RETENTION_MAX_HEAP=$RETENTION_MAX_HEAP" >> ${CONF_FILE}
printf "DONE\n"

printf "Setting up startup scripts..."
cp -a etc/systemd/system/takserver* /etc/systemd/system/
systemctl daemon-reload
printf "DONE\n"
