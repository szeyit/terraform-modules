variable "security_group_configs" {
  description = "Configuration for creating security groups"
  type = map(object({
    description   = string
    vpc_id        = string
    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress_rules = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })))
    tags = optional(map(string))
  }))
}
