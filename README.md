Terraform AWS Infrastructure Setup

This repository contains Terraform scripts to provision a highly available AWS infrastructure. It includes a Virtual Private Cloud (VPC) with public and private subnets, an Application Load Balancer (ALB), NAT Gateway, and EC2 instances.

# Features

VPC: A custom VPC with public and private subnets.
Subnets: Two public subnets and one private subnet.
NAT Gateway: Ensures internet connectivity for private instances.
Security Groups: Security groups for EC2 and ALB with proper ingress and egress rules.
Application Load Balancer: Public-facing ALB to distribute traffic to private EC2 instances.
EC2 Instances: Two EC2 instances, one in a public subnet and another in a private subnet.
Auto-provisioning Apache Web Server: User data script installs and configures Apache web server on the private EC2 instance.

# Prerequisites

AWS CLI configured with proper access.

Terraform installation (Amazon-Linux) or Follow Documentation.
 sudo yum install -y yum-utils shadow-utils
 sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
 sudo yum -y install terraform

An AWS account.


Usage:

## S3 Bucket for Terraform State

A remote backend stores the Terraform state file outside of your local file system and version control. Using S3 as a remote backend is a popular choice due to its reliability and scalability. Here's how to set it up:

1.Create an S3 Bucket: Create an S3 bucket in your AWS account to store the Terraform state. Ensure that the appropriate IAM permissions are set up.

2.Configure Remote Backend in Terraform:

# In your Terraform configuration file (e.g., main.tf), define the remote backend.
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "path/to/your/terraform.tfstate"
    region         = "us-east-1" # Change to your desired region
    encrypt        = true
  }
}


# Clone the Repository:


# Modify Variables
Update the terraform.tfvars file with your desired AMI ID and instance type:

ami_id        = "ami-0ebfd941bbafe70c6" # Replace actual imageid
instance_type = "t2.micro" # Replace based on requirement
# Subnet IDs in two availability zones (replace with your actual subnet IDs)
subnet_id = {
  "us-east-1a" = "subnet-0520b3fe7e4f7c7b2" 
  "us-east-1b" = "subnet-0637df48487e564b0"
}

# Terraform cmd:

terraform init
terraform validate
terraform plan
terraform apply


# Verify the Deployment:
 
Copy loadbalancer DNS name and paste in browser

# Clean Up
To destroy the infrastructure and release AWS resources:

terraform destroy 


