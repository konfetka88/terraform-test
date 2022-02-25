#!/bin/bash
curl -LO https://dl.k8s.io/release/v1.23.0/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /bin/

# Installs aws iam authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator
chmod +x aws-iam-authenticator
sudo mv aws-iam-authenticator /bin/ 

# Install aws cli 
sudo yum install awscli -y 

# Run this command
# Run in terminal "bash localscripts.sh"

wget https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip
unzip terraform_0.14.11_linux_amd64.zip
chmod +x terraform 
sudo mv terraform /bin/