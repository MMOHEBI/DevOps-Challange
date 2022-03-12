resource "aws_api_gateway_rest_api" "apiLambda" {
  name        = "apiLambda"
  description = "my first gateway api"
}

# Resource
resource "aws_api_gateway_resource" "ReadResource" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "{proxy+}"
}

# method
resource "aws_api_gateway_method" "MyDemoMethod" {
  rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
  resource_id   = aws_api_gateway_resource.ReadResource.id
  http_method   = "ANY"
  authorization = "NONE"
}

# integration
resource "aws_api_gateway_integration" "readInt" {
  rest_api_id             = aws_api_gateway_rest_api.apiLambda.id
  resource_id             = aws_api_gateway_resource.ReadResource.id
  http_method             = aws_api_gateway_method.MyDemoMethod.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_function.invoke_arn
}

#method
resource "aws_api_gateway_method" "proxy_root" {
  rest_api_id   = aws_api_gateway_rest_api.apiLambda.id
  resource_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  http_method   = "ANY"
  authorization = "NONE"
}

# integration
resource "aws_api_gateway_integration" "lambda_root" {
  rest_api_id             = aws_api_gateway_rest_api.apiLambda.id
  resource_id             = aws_api_gateway_method.proxy_root.resource_id
  http_method             = aws_api_gateway_method.proxy_root.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_function.invoke_arn
}


resource "aws_api_gateway_deployment" "apideploy" {
  depends_on = [
    aws_api_gateway_integration.readInt, aws_api_gateway_integration.lambda_root,
  ]
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  stage_name  = "Prod"


}

resource "aws_lambda_permission" "readPermission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.apiLambda.execution_arn}/*/*/*"
}

output "base_url" {
  value = aws_api_gateway_deployment.apideploy.invoke_url
}