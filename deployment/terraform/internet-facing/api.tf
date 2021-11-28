module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = "sec-app-http-vpc-links"
  description   = "HTTP API Gateway to SECAPP in eks deployment"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  create_api_domain_name = false

  integrations = {
    "ANY /" = {
      integration_uri    = var.integration_uri
      integration_type   = "HTTP_PROXY"
    }
  }

  tags = {
    Name = "private-api"
  }
}