#!/bin/bash
hammer content-view create --name "Capsule" --organization-id 1

hammer content-view add-repository --name "Capsule" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Enterprise Linux 7 Server RPMs x86_64 7Server"

hammer content-view add-repository --name "Capsule" --organization-id "1" \
--product "Red Hat Satellite Capsule" \
--repository "Red Hat Satellite Capsule 6.2 for RHEL 7 Server RPMs x86_64"

hammer content-view add-repository --name "Capsule" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Satellite Tools 6.2 for RHEL 7 Server RPMs x86_64"
