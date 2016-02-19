#!/bin/bash

SATELLITE=satellite.example.com
ORG="Default_Organization"
AK="Capsule-Activationkey"

firewall-cmd --add-port="53/udp" --add-port="53/tcp" \
 --add-port="67/udp" --add-port="68/udp" \
 --add-port="69/udp" --add-port="80/tcp" \
 --add-port="443/tcp" --add-port="5647/tcp" \
 --add-port="8000/tcp" --add-port="8140/tcp" \
 --add-port="8443/tcp" --add-port="9090/tcp" \
&& firewall-cmd --permanent --add-port="53/udp" --add-port="53/tcp" \
 --add-port="67/udp" --add-port="68/udp" \
 --add-port="69/udp" --add-port="80/tcp" \
 --add-port="443/tcp" --add-port="5647/tcp" \
 --add-port="8000/tcp" --add-port="8140/tcp" \
 --add-port="8443/tcp" --add-port="9090/tcp"

rpm -Uvh http://$SATELLITE/pub/katello-ca-consumer-latest.noarch.rpm

subscription-manager register --org "${ORG}" --activationkey="${AK}"

subscription-manager repos --disable "*"
subscription-manager repos --enable rhel-7-server-rpms \
--enable rhel-7-server-satellite-capsule-6.1-rpms

yum update -y


