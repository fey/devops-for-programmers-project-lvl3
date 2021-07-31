resource "digitalocean_droplet" "web" {
  count  = 2
  image  = "ubuntu-20-04-x64"
  name   = format("hexlet-devops-project-web-%02d", count.index + 1)
  region = "fra1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [digitalocean_ssh_key.ngagarinov.fingerprint]
}

resource "digitalocean_loadbalancer" "public" {
  name   = "hexlet-devops-project-web"
  region = "fra1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}

resource "digitalocean_ssh_key" "ngagarinov" {
  name       = "ngagarinov"
  public_key = var.ngagarinov_ssh_key
}

resource "digitalocean_database_cluster" "postgres" {
  name       = "hexlet-devops-project-lvl3"
  engine     = "pg"
  version    = "13"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = "hexlet-devops-project-lvl3"
}

resource "digitalocean_domain" "lvl3" {
  name       = "lvl3.devops-baby.club"
  ip_address = digitalocean_loadbalancer.public.ip
}

resource "digitalocean_certificate" "cert" {
  name    = "hexlet-devops-project-lvl3"
  type    = "lets_encrypt"
  domains = [digitalocean_domain.lvl3.id]
}
