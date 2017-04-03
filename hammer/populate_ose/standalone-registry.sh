#!/bin/bash

ORG_ID=1
PRODUCT_NAME="OCP Docker images"

upstream_repos=( openshift3/node \
openshift3/ose-haproxy-router \
openshift3/ose-deployer \
openshift3/openvswitch \
openshift3/ose-docker-registry \
openshift3/ose \
openshift3/ose-pod \
openshift3/registry-console
)

hammer product create --name "$PRODUCT_NAME" --organization-id $ORG_ID

for i in ${upstream_repos[@]}; do
  hammer repository create --name "$i" --organization-id $ORG_ID --content-type docker --url "https://registry.access.redhat.com" --docker-upstream-name "$i" --product "$PRODUCT_NAME"
done


