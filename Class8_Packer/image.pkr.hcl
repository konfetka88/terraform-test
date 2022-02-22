packer {
      required_plugins {
          amazon = {
              version = ">= 0.0.1"
              source = "github.com/hashicorp/amazon"
          }
      }
  }
  
    variable "ssh_private_key_file" {
      default = "~/.ssh/id_rsa"
  }
  variable "ssh_keypair_name" {
      default = "packer"
  }
  variable "source_ami_name" {
      default = "CentOS Linux 7 x86_64 HVM EBS ENA*"
  }
  variable "instance_type" {
      default = "t2.micro"
  }
  variable "ssh_username" {
      default = "centos"
  }
  variable "ami_name" {
      default = "bastion"
  }
  variable "region" {
      default = "us-east-2"
  }
  variable "owners" {
      default = "679593333241"
  }

  variable "ami_regions" {
      default = [
                 "us-east-1",
                 "ca-central-1",
                 "eu-west-1"
                 ]
  }

  variable "account_ids" {
      default = ["986127918014"] # Oblachko
  }
  
source "amazon-ebs" "image" {
    ami_name             = "${var.ami_name} {{timestamp}}"
    ssh_private_key_file = "${var.ssh_private_key_file}"
    ssh_keypair_name     = "${var.ssh_keypair_name}"
    instance_type        = "${var.instance_type}"
    ssh_username         = "${var.ssh_username}"
    region               = "${var.region}"
    ami_regions          = "${var.ami_regions}"
    ami_users            = "${var.account_ids}
    source_ami_filter {
        most_recent = true
        owners      = ["${var.owners}"]
        filters = {
            name                = "${var.source_ami_name}"
            virtualization-type = "hvm"
            root-device-type    = "ebs"
        }
    }
    run_tags = {
        Name = "Packer instance for ${var.source_ami_name}"
    }
}
build {
    sources = [
         "source.amazon-ebs.image"
    ]
      provisioner "shell" {
          inline = [
              "echo Installing Telnet",
              "sudo yum install telnet -y",   #Change for ubuntu
              "sudo yum install httpd -y",
              "sudo yum install php -y",
              "sudo systemctl restart httpd",
              "sudo systemctl enable httpd",
              "sudo yum install wget -y",
              "sudo wget https://wordpress.org/wordpress-4.0.32.tar.gz",
              "sudo tar -xf wordpress-4.0.32.tar.gz -C /var/www/html/",
              "sudo mv /var/www/html/wordpress/* /var/www/html/",
              "sudo yum install php-mysql -y",
              "sudo systemctl restart httpd",
              "sudo chown -R apache:apache /var/www/html/",
              "sudo systemctl restart httpd"
          ]
      }
      provisioner "breakpoint" {
          note = "Waiting for your verification"
    }
}