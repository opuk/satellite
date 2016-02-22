#!/bin/bash

ORG="Default Organization"
LOCATION="Default Location"
DOMAIN="example.com"
LC="Prod"
MEDIUM="$ORG/Library/Red_Hat_Server/Red_Hat_Enterprise_Linux_7_Server_Kickstart_x86_64_7Server"
OS="RedHat 7.2"
CV="Capsule"

hammer activation-key create --name "Prod-Capsule" --content-view "$CV" --lifecycle-environment "Prod" --organization-id 1
hammer hostgroup create --architecture x86_64 --content-view "$CV" \
  --lifecycle-environment "${LC}" --locations "${LOCATION}" --name "Capsule" \
  --operatingsystem "${OS}" --organizations "${ORG}" \
  --partition-table "Kickstart default" --subnet provnet1 --domain "${DOMAIN}" \
  --medium "${MEDIUM}" --content-source-id 1

