region = "us-east-1"
cluster_name = "my-cluster"
cluster_version = "1.21"
instance_type = "m4.large"
asg_max_size = 99
asg_min_size = 1 #min size should be 1
tags = {
  Name = "Cluster"
  Environment = "Dev"
  Team = "DevOps"
}