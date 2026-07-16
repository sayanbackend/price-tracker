output "dynamodb_table_name" {
  value = aws_dynamodb_table.price_tracker.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.price_tracker.arn
}

output "ecr_repository_url" {
  value = aws_ecr_repository.price_tracker.repository_url
}

output "lambda_function_name" {
  value = aws_lambda_function.price_tracker.function_name
}