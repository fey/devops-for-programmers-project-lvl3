terraform {
  backend "remote" {
    organization = "feycot"

    workspaces {
      name = "hexlet-devops-project-lvl3"
    }
  }
}
