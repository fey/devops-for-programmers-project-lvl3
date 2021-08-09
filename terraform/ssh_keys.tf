resource "digitalocean_ssh_key" "ngagarinov" {
  name       = "ngagarinov"
  public_key = var.ngagarinov_ssh_key
}
