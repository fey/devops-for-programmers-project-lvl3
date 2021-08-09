resource "digitalocean_domain" "lvl3" {
  name       = "lvl3.devops-baby.club"
  ip_address = digitalocean_loadbalancer.public.ip
}

resource "digitalocean_loadbalancer" "public" {
  name   = "hexlet-devops-project-web"
  region = var.region

  forwarding_rule {
    entry_port     = 443
    entry_protocol = "https"

    target_port     = var.app_port
    target_protocol = "http"

    certificate_name = digitalocean_certificate.cert.name
  }


  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = var.app_port
    target_protocol = "http"
  }

  healthcheck {
    port     = var.app_port
    protocol = "http"
    path     = "/"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}

resource "digitalocean_droplet" "web" {
  count  = 2
  image  = "docker-20-04"
  name   = format("hexlet-devops-project-web-%02d", count.index + 1)
  region = var.region
  size   = "s-1vcpu-1gb"

  ssh_keys = [digitalocean_ssh_key.ngagarinov.fingerprint]
}
