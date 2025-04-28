#!/bin/bash


##########################################################################
# Author: Lakshmi Priya Ganesan
# Version: v0.0.1
#
# Script to automatically list resources used in AWS
#
# Below services are supported by the script:
#
# 1. EC2
# 2. RDS
# 3. S3
# 4. CloudFront
# 5. VPC
# 6. IAM
# 7. Route53
# 8. CloudWatch
# 9. CloudFormation
# 10. Lambda
# 11. SNS
# 12. SQS
# 13. DynamoDB
# 14. VPC
# 15. EBS
# 16. ACM
#
# User prompt format:
# Usage: ./aws_resource_finder.sh <aws_region_name> <aws_service_name>
# Example: ./aws_resource_finder.sh us-west-2 rds
#
##########################################################################

# Validation Step 1: To Verify if all required arguments are provided

if [ $# -ne 2 ]; then
    echo "Invalid arguments provided" 
    echo "Usage: ./aws_resource_finder.sh <aws_region_name> <aws_service_name>"
    echo "Example: ./aws_resource_finder.sh us-west-2 rds" 
    exit 1
fi

# Validation Step 2: To check if aws_cli is installed

if ! command -v aws &> /dev/null; then
    echo " AWS CLI is not installed. Please install & try again."
    exit 1
fi

# Validation Step 3: To check if aws credentials are configured 

if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure & try again."
    exit 1
fi

# Assign variables

aws_region=$1
aws_service=$2
# Script to find & list resources

case $aws_service in 
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $aws_region
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $aws_region
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        aws iam list-users --region $aws_region
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $aws_region
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    acm)
        echo "Listing certificates in $aws_region"
        aws acm list-certificates --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac


