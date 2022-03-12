resource "aws_lambda_function" "lambda_function" {
  function_name    = "lambda_function"
  handler          = var.handler
  description      = "reading data from dynamobd table"
  role             = aws_iam_role.readRole.arn
  runtime          = var.runtime
  filename         = "lambda_function_payload.zip"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  #hash          = data.archived_file.lambda_zip.output_base64sha256
}

# data "archived_file" "lambda_zip_file" {
#   typ         = "zip"
#   output_path = "/home/ubuntu/DevOps_Challange/lambda.zip"
# }