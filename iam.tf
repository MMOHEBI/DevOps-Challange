resource "aws_iam_role_policy" "read_policy" {
  name = "lambda_read_policy"
  role = aws_iam_role.readRole.id

  policy = file("/home/ubuntu/DevOps_Challange/read_policy.json")
}

# iam_role
resource "aws_iam_role" "readRole" {
  name = "myReadRole"

  assume_role_policy = file("/home/ubuntu/DevOps_Challange/assume_read_policy.json")

}
