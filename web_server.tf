resource "docker_container" "web_server" {
  name  = "ngix"
  image = "nginx:stable-perl"

  ports {
    external = 3000
    internal = 80
  }
}

# APPS

resource "docker_container" "app1" {
  name  = "app1"
  image = "nginx:stable-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.app1_port
  }
}

resource "docker_container" "app2" {
  name  = "app2"
  image = "nginx:stable-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.app2_port
  }
}

resource "docker_container" "app3" {
  name  = "app3"
  image = "nginx:stable-perl"

  networks_advanced {
    name = docker_network.app_net.name
  }

  ports {
    internal = 80
    external = var.app3_port
  }
}

# Redis

resource "docker_container" "redis" {
  name  = "redis"
  image = "redis:latest"

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  ports {
    internal = 6379
    external = var.redis_port
  }
}

# PostgreSQL

resource "docker_container" "postgres" {
  name  = "postgres"
  image = "postgres:latest"

  networks_advanced {
    name = docker_network.persistence_net.name
  }

  env = [
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}",
    "POSTGRES_DB=${var.postgres_db}"
  ]

  ports {
    internal = 5432
    external = var.postgres_port
  }
}

# Grafana

resource "docker_container" "grafana" {
  name  = "grafana"
  image = "grafana/grafana:latest"

  networks_advanced {
    name = docker_network.monitor_net.name
  }

  ports {
    internal = 3000
    external = var.grafana_port
  }
}
