FROM jboss/wildfly
ENV JBOSS_BIN /opt/jboss/wildfly/bin
ENV WFL-USER $WFLY_USER
ENV WFL-PASS $WFLY_PASS
ARG WFLY_USER
ARG WFLY_PASS
ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_JNDI

RUN $JBOSS_BIN/add-user.sh ${WFLY_USER} ${WFLY_PASS} --silent
RUN mkdir /opt/jboss/wildfly/tmp

ADD mysql-connector-java-8.0.28.jar $JBOSS_HOME/tmp
ADD wildfly-config.sh /$JBOSS_HOME/tmp
USER root
RUN chmod 777 $JBOSS_HOME/tmp/wildfly-config.sh
USER jboss

RUN $JBOSS_HOME/tmp/wildfly-config.sh "$DB_JNDI"
RUN rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/

EXPOSE 8080 9990 8787
#ADD demo.war $JBOSS_HOME/standalone/deployments/
#rm tmp folder
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "--debug"]