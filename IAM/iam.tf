resource "aws_iam_user" "lb" {
  name = "userCreatedWithTerraform"
}

resource "aws_iam_user" "multiuser" {
  name     = each.key
  for_each = toset(["bob", "sam", "lisa"])
}

resource "aws_iam_group" "myTest" {
  name = "myTest"
}

resource "aws_iam_group_membership" "developers_team" {
  name  = "developers-group-membership"
  users = [aws_iam_user.lb.name]    # or "userCreatedWithTerraform"
  group = aws_iam_group.myTest.name # or "myTest"
}