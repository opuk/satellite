#!/bin/bash
hammer content-view create --name "RHEL7" --organization-id 1

hammer content-view add-repository --name "RHEL7" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Enterprise Linux 7 Server - Extras RPMs x86_64"

hammer content-view add-repository --name "RHEL7" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Enterprise Linux 7 Server RPMs x86_64 7Server"

hammer content-view add-repository --name "RHEL7" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Enterprise Linux 7 Server - Optional RPMs x86_64 7Server"

hammer content-view add-repository --name "RHEL7" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Satellite Tools 6.2 for RHEL 7 Server RPMs x86_64"
