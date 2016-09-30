#!/bin/bash
#hammer organization list
ORG_ID=1
RELEASEVER=7Server

#hammer repository-set list --product "Red Hat Enterprise Linux Server" --organization-id 1
hammer repository-set disable --name "Red Hat Enterprise Linux 7 Server (RPMs)" --product "Red Hat Enterprise Linux Server" --organization-id $ORG_ID --basearch x86_64 --releasever $RELEASEVER
hammer repository-set disable --name "Red Hat Satellite Tools 6.2 (for RHEL 7 Server) (RPMs)" --product "Red Hat Enterprise Linux Server" --organization-id $ORG_ID --basearch x86_64 
hammer repository-set disable --name "Red Hat Enterprise Linux 7 Server - Extras (RPMs)" --product "Red Hat Enterprise Linux Server" --organization-id $ORG_ID --basearch x86_64 
hammer repository-set disable --name "Red Hat OpenShift Enterprise 3.2 (RPMs)" --product "Red Hat OpenShift Enterprise" --organization-id $ORG_ID --basearch x86_64 
