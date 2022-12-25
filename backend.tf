terraform {
  cloud {
    organization = "tubone24-test"

    workspaces {
      name = "spotify"
    }
  }
}