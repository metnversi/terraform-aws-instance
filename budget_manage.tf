resource "aws_budgets_budget" "example" {
    name              = "example"
    budget_type       = "COST"
    limit_amount      = "1"
    limit_unit        = "USD"
    time_period_start = "2024-06-01_00:00"
    time_unit         = "MONTHLY"

    cost_filter {
        name   = "Service"
        values = ["Amazon Simple Storage Service"]
    }
}