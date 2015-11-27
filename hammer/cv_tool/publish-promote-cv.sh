#!/bin/sh
source ./vars

echo -n "Password: "
read -s pwd
echo

hammer -u $USERNAME -p $pwd content-view list --organization "$ORGANIZATION"

echo -n "Content view to publish [id]: "
read content_view

hammer -u $USERNAME -p $pwd content-view publish --id $content_view --organization "$ORGANIZATION"

hammer -u $USERNAME -p $pwd content-view version list --content-view-id "$content_view" --organization "$ORGANIZATION"

echo -n "Promote version [id]: "
read version

hammer -u $USERNAME -p $pwd lifecycle-environment list --organization "$ORGANIZATION"

echo -n "Promote to environment [id]: "
read promote_to

hammer -u $USERNAME -p $pwd content-view version promote --content-view-id $content_view --organization "$ORGANIZATION" --id $version --lifecycle-environment-id $promote_to
 
