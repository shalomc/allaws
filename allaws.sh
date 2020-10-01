#!/usr/bin/env bash

AWSCOMMAND=$*

# fetch regions list 
REGIONS=`aws ec2 describe-regions --filters "Name=opt-in-status,Values=opt-in-not-required,opted-in" --no-all-regions --query "Regions[*].RegionName" --output text`

# execute command for all regions

for region in $REGIONS; do
    echo Region $region
	aws $AWSCOMMAND --region $region
done
