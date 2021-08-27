output "sidecars" {
  value = [
    {
      name   = "nginx"
      image  = "nginx:stable-alpine"
      cpu    = var.cpu
      memory = var.memory
      env = [
        {
          name  = "WEBAPP_ADDR"
          value = var.webapp_addr
        }
      ]
      volumesFrom = [{ sourceContainer = var.app_metadata["main_container"] }]
    }
  ]
}

output "mount_points" {
  value = [
    {
      sourceVolume  = "app-public"
      containerPath = "/app/public"
    },
    {
      sourceVolume  = "nginx-confd"
      containerPath = "/etc/nginx/conf.d"
    },
    {
      sourceVolume  = "nginx-templates"
      containerPath = "/etc/nginx/templates"
    }
  ]
}
