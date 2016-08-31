#!/bin/bash
CV_NAME=CloudForms


hammer content-view create --name "$CV_NAME" --organization-id 1

hammer content-view add-repository --name "$CV_NAME" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Enterprise Linux 7 Server RPMs x86_64 7Server"

hammer content-view add-repository --name "$CV_NAME" --organization-id "1" \
--product "Red Hat Software Collections for RHEL Server" \
--repository "Red Hat Software Collections RPMs for Red Hat Enterprise Linux 7 Server x86_64 7Server"

hammer content-view add-repository --name "$CV_NAME" --organization-id "1" \
--product "Red Hat Enterprise Linux Server" \
--repository "Red Hat Satellite Tools 6.2 for RHEL 7 Server RPMs x86_64"

hammer content-view add-repository --name "$CV_NAME" --organization-id "1" \
--product "Red Hat CloudForms" \
--repository "Red Hat CloudForms Management Engine 5.6 RPMs x86_64"
