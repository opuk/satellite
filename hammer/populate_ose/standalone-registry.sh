#!/bin/bash

ORG_ID=1
PRODUCT_NAME="OCP Docker images"

upstream_repos=( registry.access.redhat.com/openshift3/node \
registry.access.redhat.com/openshift3/ose-haproxy-router \
registry.access.redhat.com/openshift3/ose-deployer \
registry.access.redhat.com/openshift3/openvswitch \
registry.access.redhat.com/openshift3/ose-docker-registry \
registry.access.redhat.com/openshift3/ose \
registry.access.redhat.com/openshift3/ose-pod \
registry.access.redhat.com/openshift3/registry-console
)

hammer product create --name "$PRODUCT_NAME" --organization-id $ORG_ID

for i in ${upstream_repos[@]}; do
  hammer repository create --name "$i" --organization-id $ORG_ID --content-type docker --url "https://registry.access.redhat.com" --docker-upstream-name "$i" --product "$PRODUCT_NAME"
done


