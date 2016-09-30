#!/bin/bash
#hammer organization list
ORG_ID=1
RELEASEVER=7Server

#hammer repository-set list --product "Red Hat Enterprise Linux Server" --organization-id 1
hammer repository-set enable --name "Red Hat Satellite Capsule 6.2 (for RHEL 7 Server) (RPMs)" --product "Red Hat Satellite Capsule" --organization-id $ORG_ID --basearch x86_64



