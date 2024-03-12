variable "instances_configs" {
  description = "Configuration for EC2 instances"
  type = map(object({
    subnet_id              = string
    security_group_names   = list(string)
    launch_template_name   = string
    launch_template_version = optional(string)
    ami                    = optional(string)
    instance_type          = optional(string)
    user_data              = optional(string)
    tags                   = optional(map(string))
  }))
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}

variable "security_group_ids_by_name" {
  description = "Map of security group names to their IDs."
  type        = map(string)
}

variable "launch_template_ids" {
  description = "Map of launch template names to their IDs."
  type        = map(string)
}
