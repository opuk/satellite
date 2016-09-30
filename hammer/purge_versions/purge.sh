#!/bin/bash
#Deletes all versions except the latest
# $1 Name of content view
# $2 Organization

if [ -z $1 ]; then
  echo "Need to provide content view."
  exit 1
fi

if [ -z "$2" ]; then
  echo "Provide organization."
  exit 1
fi

hammer --csv content-view version list --content-view "$1" --organization "$2" | grep '""' | sort -n | awk -F, '{ print $1 }' > versions_to_delete
for i in $(cat versions_to_delete); do hammer content-view version delete --organization "$2" --content-view "$1" --id $i; done

rm -f versions_to_delete
