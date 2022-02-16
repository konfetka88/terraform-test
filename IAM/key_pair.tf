resource "aws_key_pair" "deployer" {
  key_name_prefix = "deployer-key"
  public_key      = file("~/.ssh/id_rsa.pub")
}