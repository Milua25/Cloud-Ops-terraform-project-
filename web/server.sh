#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
cd /tmp
sudo yum update -y
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_arm64/amazon-ssm-agent.rpm
sudo systemctl enable amazon-ssm-agent 
sudo systemctl start amazon-ssm-agent
sudo systemctl status amazon-ssm-agent

sudo mkdir /home/ssm-user/.aws/
sudo touch /home/ssm-user/.aws/config
sudo chown -R ssm-user:ssm-user /home/ssm-user/.aws/
sudo echo -e "[profile s3_profile] \nrole_arn = arn:aws:iam::462446508222:role/dev-ssm-role \ncredential_source = Ec2InstanceMetadata " > /home/ssm-user/.aws/config

