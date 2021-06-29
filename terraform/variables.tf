variable "region1" {
  description = "Stockholm region"
  default     = "eu-north-1"
  type        = string
}

variable "region-az1" {
  description = "Stockholm region A"
  default     = "eu-north-1a"
  type        = string
}

variable "default_vpc_name" {
  default = "Otto"
  type    = string
}



variable "root_account" {
  type = string
}
