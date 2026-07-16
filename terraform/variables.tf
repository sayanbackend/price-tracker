variable "dynamodb_table_name" {
  type    = string
  default = "PriceTracker"
}

variable "ecr_repo_name" {
  type    = string
  default = "price-tracker"
}