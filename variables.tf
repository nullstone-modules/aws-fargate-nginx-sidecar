variable "app_metadata" {
  description = <<EOF
App Metadata is injected from the app on-the-fly.
This contains information about resources created in the app module that are needed by the capability.
EOF

  type    = map(string)
  default = {}
}

variable "cpu" {
  type        = number
  default     = 256
  description = <<EOF
The amount of CPU units to reserve for the container.
1024 CPU units is roughly equivalent to 1 vCPU.
This means the default of 256 CPU units is roughly .25 vCPUs.
A vCPU is a virtualization of a physical CPU.
EOF
}

variable "memory" {
  type        = number
  default     = 512
  description = <<EOF
The amount of memory to reserve and cap the container.
If the service exceeds this amount, the container will be killed with exit code 127 representing "Out-of-memory".
Memory is measured in MiB, or megabytes.
This means the default is 512 MiB or 0.5 GiB.
EOF
}

variable "webapp_addr" {
  type        = string
  default     = "localhost:9000"
  description = <<EOF
This address refers to the port exposed by the main container of the service.
Nginx will inject this as the env var WEBAPP_ADDR so that nginx can forward dynamic content to the main container.
EOF
}
