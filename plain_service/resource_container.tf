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

  dynamic "ports" {
    for_each = var.ports
    content {
      internal = ports.value["internal"]
      external = ports.value["external"]
      protocol = ports.value["protocol"]
    }
  }

  networks_advanced {
    name = var.network_id
  }

  command = var.command

  dynamic "devices" {
    for_each = var.devices
    content {
      container_path = devices.value["container_path"]
      host_path = devices.value["host_path"]
    }
  }

  dynamic "labels" {
    for_each = var.labels
    content {
      label = labels.value["label"]
      value = labels.value["value"]
    }
  }
}
