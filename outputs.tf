output "sidecars" {
  value = [
    {
      name   = "nginx"
      image  = "nginx:stable-alpine"
      environment = [
        {
          name  = "WEBAPP_ADDR"
          value = var.webapp_addr
        }
      ]
      volumesFrom = [{ sourceContainer = var.app_metadata["main_container"] }]

      portMappings = var.app_metadata["service_port"] == 0 ? [] : [
        {
          protocol      = "tcp"
          containerPort = var.app_metadata["service_port"]
          hostPort      = var.app_metadata["service_port"]
        }
      ]

      dependsOn = [
        {
          containerName = var.app_metadata["main_container"]
          condition     = "START"
        }
      ]
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
