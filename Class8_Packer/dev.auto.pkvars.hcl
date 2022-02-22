ssh_private_key_file = "/home/ec2-user/.ssh/id_rsa"
ssh_keypair_name = "packer"
ami_name = "packerclass"
region = "us-east-2"
instance_type = "t2.micro"

# OS specific settings

source_ami_name = "CentOS Linux 7 x86_64 HVM EBS ENA*"
ssh_username    = "centos"
owners          = "679593333241"