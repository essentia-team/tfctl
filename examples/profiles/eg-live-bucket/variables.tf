variable "config" {
  description = "Configuration generated by tfctl"
  type = string
}

locals {
  config = jsondecode(var.config)
  account_id = "${data.aws_caller_identity.current.account_id}"
  # get account configuration from tfctl
  account = [ for account in local.config["accounts"]: account if account["id"] == local.account_id ][0]
}
