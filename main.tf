terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
}


resource "docker_network" "app_net" {
  name = "app_net"
}

resource "docker_network" "persistence_net" {
  name = "persistence_net"
}

resource "docker_network" "monitor_net" {
  name = "monitor_net"
}