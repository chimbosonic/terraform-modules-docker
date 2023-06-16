resource "docker_container" "container" {
  name  = var.name
  image = docker_image.image.image_id

  env = var.env_vars
  
  dynamic "volumes" {
    for_each = var.volumes
    content {
      volume_name = volumes.value["volume_name"]
      container_path = volumes.value["container_path"]
      host_path = volumes.value["host_path"]
      read_only = volumes.value["read_only"]
    }
  }

  networks_advanced {
    name = var.network_id
  }
  
  labels {
    label = "traefik.enable"
    value = "true"
  }
  labels {
    label = "traefik.http.middlewares.${var.name}-redirect-web-secure.redirectscheme.scheme"
    value = "https"
  }
  labels {
    label = "traefik.http.routers.${var.name}-web.middlewares"
    value = "${var.name}-redirect-web-secure"
  }
  labels {
    label = "traefik.http.routers.${var.name}-web.rule"
    value = "Host(`${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.${var.name}-web.entrypoints"
    value = "web"
  }
  labels {
    label = "traefik.http.routers.${var.name}-web-secure.rule"
    value = "Host(`${var.domain_name}`)"
  }
  labels {
    label = "traefik.http.routers.${var.name}-web-secure.tls"
    value = "true"
  }
  labels {
    label = "traefik.http.routers.${var.name}-web-secure.entrypoints"
    value = "websecure"
  }
  labels {
    label = "traefik.http.services.${var.name}-web-secure.loadbalancer.server.port"
    value = var.service_port
  }
}