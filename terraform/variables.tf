variable "do_token" {
  type = string
  sensitive = true
}

variable "ngagarinov_ssh_key" {
  type = string
}

variable "datadog_api_key" {
  type = string
}

variable "datadog_app_key" {
  type = string
}

variable "app_port" {
  type = number
  default = 8000
}
