#!/bin/bash

CUSTOMER_NAME="Default Organization"
LOCATION="Default Location"
DOMAIN="example.com"
MANIFEST=/root/manifest.zip

#Network configuration (first provision network)
NETNAME=provnet1
GATEWAY=192.168.122.1
DNS1=192.168.122.1
DNS2=4.2.2.2
NETWORK=192.168.122.0
NETMASK=255.255.255.0
DHCPSTART=192.168.122.100
DHCPSTOP=192.168.122.200

# Create the $CUSTOMER_NAME Organisation
#hammer organization create --name "$CUSTOMER_NAME"

# Create the $LOCATION Location, one of the datacenters
#hammer location create --name "$LOCATION"

# Upload the Satellite Manifest
hammer subscription upload --organization "$CUSTOMER_NAME" --file $MANIFEST

# Add the domain, domain is usually created by katello-installer
hammer domain create --name $DOMAIN

# Create subnet
#hammer subnet create --dns-primary $DNS1 --dns-secondary $DNS2 --name $NETNAME --network "$NETWORK" --mask $NETMASK --gateway $GATEWAY --domains "$DOMAIN" --from $DHCPSTART --to $DHCPSTOP --dhcp-id 1 --tftp-id 1
hammer subnet create --dns-primary $DNS1 --dns-secondary $DNS2 --name $NETNAME --network "$NETWORK" --mask $NETMASK --gateway $GATEWAY --domains "$DOMAIN" --ipam "None"

# Add domain, smart-proxy and subnet to organisation
hammer organization add-domain --name "$CUSTOMER_NAME" --domain $DOMAIN
#hammer organization add-smart-proxy --name "$CUSTOMER_NAME" --smart-proxy $SATELLITE
hammer organization add-subnet --name "$CUSTOMER_NAME" --subnet $NETNAME

# Add domain, smart-proxy and subnet to location
hammer location add-domain --name "$LOCATION" --domain $DOMAIN
#hammer location add-smart-proxy --name $LOCATION --smart-proxy rhs.$CUSTOMER_NAME.domain
hammer location add-subnet --name "$LOCATION" --subnet $NETNAME

#Create basic lifecycle environment
hammer lifecycle-environment create --name Dev --prior Library --organization "$CUSTOMER_NAME"
hammer lifecycle-environment create --name QA --prior Dev --organization "$CUSTOMER_NAME"
hammer lifecycle-environment create --name Prod --prior QA --organization "$CUSTOMER_NAME"

#Create partition table
hammer partition-table create --file files/vda-only-all-root --name "vda only, all root" --os-family Redhat
hammer partition-table create --file files/sda-only-all-root --name "sda only, all root" --os-family Redhat
#Associate partition table to OS
hammer os add-ptable --title "RedHat 7.2" --partition-table "vda only, all root"
hammer os add-ptable --title "RedHat 7.2" --partition-table "sda only, all root"
