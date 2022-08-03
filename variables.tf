variable "app_metadata" {
  description = <<EOF
Nullstone automatically injects metadata from the app module into this module through this variable.
This variable is a reserved variable for capabilities.
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
