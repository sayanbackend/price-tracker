resource "aws_cloudwatch_event_rule" "price_check_schedule" {
  name                = "price-tracker-schedule"
  schedule_expression = "rate(12 hours)"
}

resource "aws_cloudwatch_event_target" "price_tracker_target" {
  rule      = aws_cloudwatch_event_rule.price_check_schedule.name
  target_id = "price-tracker-lambda"
  arn       = aws_lambda_function.price_tracker.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.price_tracker.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.price_check_schedule.arn
}