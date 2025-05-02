#!/bin/bash

# Extract the private IP address from the JSON file
IP=$(jq -r '.Instances[0].PrivateIpAddress' info.json)

# Replace line 40 in terraform.tf with the updated IP value
sed -i "40s/.*/  ec2_private_ip = \"${IP}\"/" terraform.tf

# Display confirmation
echo "Private IP has been updated in terraform.tf: ${IP}"
