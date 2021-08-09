output "dropelt_ips" {
  value = digitalocean_droplet.web.*.ipv4_address
}

output "database_credentials" {
  value = {
    db_host     = digitalocean_database_cluster.postgres.host
    db_port     = digitalocean_database_cluster.postgres.port
    db_database = digitalocean_database_cluster.postgres.database
    db_username = digitalocean_database_cluster.postgres.user
    db_password = digitalocean_database_cluster.postgres.password
  }

  sensitive = true
}
