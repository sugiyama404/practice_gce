variable "region" {}
variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.1.0.0/24"
}
variable "allowed_ingress_ports" {
  description = "List of allowed ingress ports"
  type        = list(string)
  default     = ["80", "22"]
}

variable "allowed_egress_ports" {
  description = "List of allowed egress ports"
  type        = list(string)
  default     = ["80", "443"]
}

variable "allowed_ingress_sources" {
  description = "Allowed ingress source IP ranges"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
