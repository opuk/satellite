#!/bin/bash 

updates=$(yum --security check-update | grep needed)

if [ ! -z "$updates" ]; then
  echo $updates
else
  echo "No updates available. Possibly no repositories configured."
  exit 1
fi

