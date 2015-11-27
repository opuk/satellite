#!/bin/sh
source ./vars
echo -n "Password: "
read -s pwd

hammer -u admin -p $pwd content-view list --organization "$ORGANIZATION"
