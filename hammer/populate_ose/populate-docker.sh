#!/bin/bash

ORG_ID=1
PRODUCT_NAME="OSE Docker images"

upstream_repos=( openshift3/ose-deployer openshift3/ose-docker-registry openshift3/ose-pod openshift3/ose-docker-builder openshift3/ose-sti-builder openshift3/ose-haproxy-router openshift3/mongodb-24-rhel7 openshift3/mysql-55-rhel7 openshift3/nodejs-010-rhel7 openshift3/perl-516-rhel7 openshift3/php-55-rhel7 openshift3/postgresql-92-rhel7 openshift3/python-33-rhel7 openshift3/ruby-20-rhel7 openshift3/logging-deployment openshift3/logging-elasticsearch openshift3/logging-kibana openshift3/logging-fluentd openshift3/logging-auth-proxy openshift3/metrics-deployer openshift3/metrics-hawkular-metrics openshift3/metrics-cassandra openshift3/metrics-heapster openshift3/jenkins-1-rhel7 openshift3/image-inspector openshift3/ose-recycler )

hammer product create --name "$PRODUCT_NAME" --organization-id $ORG_ID

for i in ${upstream_repos[@]}; do
  hammer repository create --name "$i" --organization-id $ORG_ID --content-type docker --url "https://registry.access.redhat.com" --docker-upstream-name "$i" --product "$PRODUCT_NAME"
done


