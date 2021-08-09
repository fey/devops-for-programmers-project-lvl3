variable "ngagarinov_ssh_key" {
  type = string
}

variable "app_port" {
  type    = number
  default = 8000
}

variable "region" {
  type = string
  default = "fra1"
}

variable "datadog_api_key" {
  type = string
  sensitive = true
}

variable "datadog_app_key" {
  type = string
  sensitive = true
}

variable "do_token" {
  type      = string
  sensitive = true
}
