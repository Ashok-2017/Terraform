resource "aws_api_gateway_resource" "secured" {
  rest_api_id = var.rest_api_id
  path_part = "secured" 
}

resource "aws_api_gateway_model" "reminder" {
  rest_api_id = var.rest_api_id
  name = "secured"
  description = "A JSON schema"
  content_type = "application/json"
  schema = file("${path.module}/request_schemas/a.json")
}

resource "aws_api_gateway_request_validator" "reminder" {
  name = "Remindermodel-${local.Env}"
  rest_api_id = var.rest_api_id
  validate_request_body = true
  validate_request_parameters = true
}

module "secured-post-method" {
  source = "../modules/"
  rest_api_id               = var.rest_api_id
  resource_id               = aws_api_gateway_resource.approval_v1.id
  request_models            = {"application/json" = aws_api_gateway_model.approval.name}
  request_validator_id      = aws_api_gateway_request_validator.approval.id
  http_method = "POST"
  authorization = "AWS_IAM"
  timeout_milliseconds      = 29000
  uri                       = data.aws_lambda_function.handle-secured.invoke_arn
  execution_arn             = var.rest_api_execution_arn
  function_name             = data.aws_lambda_function.handle-secured.function_name
  path                      = aws_api_gateway_resource.approval_v1.path
  response200               = true
  response202               = false
  response400               = false
  response401               = false
  response403               = false
}

resource "aws_lambda_permission" "handle" {
  action = "lambda:InvokeFunction"
  function_name = " "
  principal = "apigateway.amazonaws.com"
  source_arn = "${var.rest_api_execution_arn}/*/*${aws_api_gateway_resource.approval_v1.path}"
}
