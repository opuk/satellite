#!/bin/bash

ORG_ID=1
PRODUCT_NAME="OCP Docker images"

#openshift3/nodejs-010-rhel7 \
#dotnet/dotnetcore-10-rhel7 \
#jboss-amq-6/amq62-openshift \
#jboss-datagrid-6/datagrid65-openshift \
#jboss-decisionserver-6/decisionserver62-openshift \
#jboss-decisionserver-6/decisionserver63-openshift \
#jboss-eap-6/eap64-openshift \
#jboss-eap-7/eap70-openshift \
#jboss-fuse-6/fis-java-openshift \
#jboss-fuse-6/fis-karaf-openshift \
#jboss-processserver-6/processserver63-openshift \
#jboss-webserver-3/webserver30-tomcat7-openshift \
#jboss-webserver-3/webserver30-tomcat8-openshift \

upstream_repos=( openshift3/ose-deployer \ 
     openshift3/ose-docker-registry \
     openshift3/ose-pod \
     openshift3/ose-docker-builder \ 
     openshift3/ose-sti-builder \ 
     openshift3/ose-haproxy-router \ 
     openshift3/mongodb-24-rhel7 \ 
     openshift3/mysql-55-rhel7 \
     openshift3/perl-516-rhel7 \
     openshift3/php-55-rhel7 \ 
     openshift3/postgresql-92-rhel7 \
     openshift3/python-33-rhel7 \
     openshift3/ruby-20-rhel7 \
     openshift3/logging-deployment \
     openshift3/logging-elasticsearch \
     openshift3/logging-kibana \
     openshift3/logging-fluentd \
     openshift3/logging-auth-proxy \
     openshift3/metrics-deployer \
     openshift3/metrics-hawkular-metrics \
     openshift3/metrics-cassandra \
     openshift3/metrics-heapster \
     openshift3/jenkins-1-rhel7 \
     openshift3/image-inspector \
     openshift3/ose-recycler \
     rhscl/mariadb-101-rhel7 \
     rhscl/mongodb-26-rhel7 \
     rhscl/mongodb-32-rhel7 \
     rhscl/mysql-56-rhel7 \
     rhscl/nodejs-4-rhel7 \
     rhscl/perl-520-rhel7 \
     rhscl/php-56-rhel7 \
     rhscl/postgresql-94-rhel7 \
     rhscl/postgresql-95-rhel7 \
     rhscl/python-27-rhel7 \
     rhscl/python-34-rhel7 \
     rhscl/python-35-rhel7 \
     rhscl/ruby-22-rhel7 \
     rhscl/ruby-23-rhel7 \ )

hammer product create --name "$PRODUCT_NAME" --organization-id $ORG_ID

for i in ${upstream_repos[@]}; do
  hammer repository create --name "$i" --organization-id $ORG_ID --content-type docker --url "https://registry.access.redhat.com" --docker-upstream-name "$i" --product "$PRODUCT_NAME"
done


