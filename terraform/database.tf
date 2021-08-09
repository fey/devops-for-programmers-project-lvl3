resource "digitalocean_database_cluster" "postgres" {
  name       = "hexlet-devops-project-lvl3"
  engine     = "pg"
  version    = "13"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = "hexlet-devops-project-lvl3"
}
