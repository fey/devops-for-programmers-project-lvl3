resource "digitalocean_certificate" "cert" {
  name    = "hexlet-devops-project-lvl3-cert"
  type    = "lets_encrypt"
  domains = ["lvl3.devops-baby.club"]
}
