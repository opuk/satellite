#!/bin/bash

ORG="Default Organization"
LOCATION="Default Location"
DOMAIN="example.com"
LC="Prod"
MEDIUM="$ORG/Library/Red_Hat_Server/Red_Hat_Enterprise_Linux_7_Server_Kickstart_x86_64_7Server"
OS="RedHat 7.2"
CV="Capsule"
AK="Prod-Capsule"
HC_NAME="Capsules"
CONTENT_LABEL="rhel-7-server-satellite-capsule-6.1-rpms"
#hammer subscription list --organization-id 1
SUB_ID=4028fa5c531830b801531836b5aa00dc

hammer host-collection create --name "$HC_NAME" --organization "$ORG"
hammer activation-key create --name "$AK" --content-view "$CV" --lifecycle-environment "$LC" --organization-id 1
hammer activation-key add-subscription --name "$AK" --subscription-id "$SUB_ID" --organization "$ORG"
hammer activation-key add-host-collection --host-collection "$HC_NAME" --name "$AK" --organization "$ORG"
hammer activation-key content-override --name "$AK" --organization "$ORG" --value 1 --content-label "$CONTENT_LABEL"

hammer hostgroup create --architecture x86_64 --content-view "$CV" \
  --lifecycle-environment "${LC}" --locations "${LOCATION}" --name "Capsule" \
  --operatingsystem "${OS}" --organizations "${ORG}" \
  --partition-table "Kickstart default" --subnet provnet1 --domain "${DOMAIN}" \
  --medium "${MEDIUM}" --content-source-id 1

