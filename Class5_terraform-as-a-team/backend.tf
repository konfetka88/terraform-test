terraform {
  backend "s3" {
    bucket = "backend-class-rdm"
    key    = "path/to/my/key"  
    region = "us-east-1"
    dynamodb_table = "prod"
  }
}