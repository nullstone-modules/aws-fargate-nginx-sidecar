variable "app_metadata" {
  description = <<EOF
App Metadata is injected from the app on-the-fly.
This contains information about resources created in the app module that are needed by the capability.
EOF

  type    = map(string)
  default = {}
}

variable "webapp_addr" {
  type        = string
  default     = "localhost:9000"
  description = <<EOF
This address refers to the port exposed by the main container of the service.
Nginx will inject this as the env var WEBAPP_ADDR so that nginx can forward dynamic content to the main container.
EOF
}
