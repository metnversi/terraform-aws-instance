resource "aws_budgets_budget" "ec2" {
  name              = "budget-ec2-monthly"
  budget_type       = "COST"
  limit_amount      = "0.5"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2024-08-01_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["nguyenthevinh2002.xuantruong@gmail.com"]
  }
}
resource "aws_budgets_budget" "cost" {
  budget_type  = "COST"
  limit_amount = "2"
  limit_unit   = "USD"

  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2024-08-01_00:00"
  time_unit         = "MONTHLY"
}

