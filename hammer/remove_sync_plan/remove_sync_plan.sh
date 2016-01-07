#!/bin/bash
for i in $(hammer --csv product list --organization Lab | awk -F, '{ print $1 }'); do hammer product remove-sync-plan --id $i --organization Lab; done
