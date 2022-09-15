#!/bin/bash 

# AMI_ID="ami-00ff427d936335825"

COMPONENT=$1

AMI_ID=$(aws ec2 describe-images  --filters "Name=name,Values=DevOps-LabImage-CentOS7"  | jq '.Images[].ImageId' | sed -e 's/"//g')
SGID="sg-000671b0e1fb3d069"
echo "The AMI which we are using is $AMI_ID"

aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro  --security-group-ids ${SGID} --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]"