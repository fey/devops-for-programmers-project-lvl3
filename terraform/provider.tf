terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = "https://api.datadoghq.com/"
}

resource "datadog_monitor" "healthcheck" {
  name    = "Devops Project LVL3 healthcheck"
  type    = "service check"
  message = "Healthcheck failed from {{host.name}}"
  query   = "\"http.can_connect\".over(\"instance:devops_lvl3_project_status\").by(\"host\",\"instance\",\"url\").last(2).count_by_status()"
}
