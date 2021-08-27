output "sidecars" {
  // Using jsonencode because all map values must be of the same type
  value = [
    {
      name   = "nginx"
      image  = "nginx:stable-alpine"
      environment = jsonencode([
        {
          name  = "WEBAPP_ADDR"
          value = var.webapp_addr
        }
      ])
      volumesFrom = jsonencode([{ sourceContainer = var.app_metadata["main_container"] }])

      portMappings = jsonencode(var.app_metadata["service_port"] == 0 ? [] : [
        {
          protocol      = "tcp"
          containerPort = var.app_metadata["service_port"]
          hostPort      = var.app_metadata["service_port"]
        }
      ])

      dependsOn = jsonencode([
        {
          containerName = var.app_metadata["main_container"]
          condition     = "START"
        }
      ])
    }
  ]
}

output "mount_points" {
  value = [
    {
      name = "app-public"
      path = "/app/public"
    },
    {
      name = "nginx-confd"
      path = "/etc/nginx/conf.d"
    },
    {
      name = "nginx-templates"
      path = "/etc/nginx/templates"
    }
  ]
}
