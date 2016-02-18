#!/bin/bash
ORG="Default Organization"
IFS=$'\n'
for i in $(hammer --csv  product list --organization-id 1 | grep -v ,0 | awk -F, '{ print $2 }' | grep -v Name); do
  hammer product synchronize --name "${i}" --organization "${ORG}"
done
unset $IFS
