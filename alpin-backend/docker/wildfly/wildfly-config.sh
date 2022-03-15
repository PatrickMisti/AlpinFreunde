#!/bin/bash

$JBOSS_BIN/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 &
sleep 6
echo ''
echo '**************************************************'
echo 'DBIndi'
echo $DB_JNDI
echo "$DB_JNDI"
echo 'Starting Jboss-cli config'
$JBOSS_BIN/jboss-cli.sh -c << EOF
deploy $JBOSS_HOME/tmp/mysql-connector-java-8.0.28.jar --name=mysql
data-source add --jndi-name=java:jboss/datasources/$DB_JNDI --name=$DB_JNDI --connection-url=jdbc:mysql://db/$DB_NAME --driver-name=mysql --user-name=$DB_USER --password=$DB_PASS --max-pool-size=25
shutdown
EOF
echo 'End of config'
echo '**************************************************'