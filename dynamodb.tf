# created the dynamodb table
resource "aws_dynamodb_table" "example" {
  name             = "EmployeeTable"
  hash_key         = "EmpID"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "EmpID"
    type = "S"
  }

}

#stored two data
resource "aws_dynamodb_table_item" "example" {
  table_name = aws_dynamodb_table.example.name
  hash_key   = aws_dynamodb_table.example.hash_key

  item = <<ITEM
    {
  "EmpID": {"S": "001"},
  "EmpFirst": {"S": "Mansoor"},
  "EmpLast": {"S": "Mohebi"}
}
ITEM
}

