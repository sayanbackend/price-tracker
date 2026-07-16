resource "aws_iam_role" "price_tracker_lambda" {
  name = "price-tracker-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "price_tracker_basic_execution" {
  role       = aws_iam_role.price_tracker_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy" "price_tracker_dynamodb_access" {
  name = "price-tracker-dynamodb-access"
  role = aws_iam_role.price_tracker_lambda.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["dynamodb:GetItem", "dynamodb:PutItem"]
      Resource = aws_dynamodb_table.price_tracker.arn
    }]
  })
}

resource "aws_lambda_function" "price_tracker" {
  function_name = "price-tracker"
  role          = aws_iam_role.price_tracker_lambda.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.price_tracker.repository_url}:latest"
  timeout       = 30
  memory_size   = 256

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.price_tracker.name
    }
  }
}