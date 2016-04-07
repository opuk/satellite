#!/bin/bash

ORG_ID=1
PRODUCT_NAME="Containers"

upstream_repos=( openshift3/ose-deployer openshift3/ose-docker-registry openshift3/ose-pod openshift3/ose-docker-builder openshift3/ose-sti-builder openshift3/ose-haproxy-router )

hammer product create --name "$PRODUCT_NAME" --organization-id 1

for i in ${upstream_repos[@]}; do
  hammer repository create --name "$i" --organization-id $ORG_ID --content-type docker --url "https://registry.access.redhat.com" --docker-upstream-name "$i" --product "$PRODUCT_NAME"
done


