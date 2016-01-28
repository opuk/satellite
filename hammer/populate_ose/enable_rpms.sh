#!/bin/bash
#hammer organization list
ORG_ID=1
RELEASEVER=7Server

#hammer repository-set list --product "Red Hat Enterprise Linux Server" --organization-id 1
hammer repository-set enable --name "Red Hat Enterprise Linux 7 Server (RPMs)" --product "Red Hat Enterprise Linux Server" --organization-id $ORG_ID --basearch x86_64 --releasever $RELEASEVER
hammer repository-set enable --name "Red Hat Satellite Tools 6.1 (for RHEL 7 Server) (RPMs)" --product "Red Hat Enterprise Linux Server" --organization-id $ORG_ID --basearch x86_64 --releasever $RELEASEVER
hammer repository-set enable --name "Red Hat Enterprise Linux 7 Server - Extras (RPMs)" --product "Red Hat Enterprise Linux Server" --organization-id $ORG_ID --basearch x86_64 --releasever $RELEASEVER
hammer repository-set enable --name "Red Hat OpenShift Enterprise 3.1 (RPMs)" --product "Red Hat OpenShift Enterprise" --organization-id $ORG_ID --basearch x86_64 --releasever $RELEASEVER
