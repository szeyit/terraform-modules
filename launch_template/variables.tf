variable "launch_template_configs" {
  description = "Configuration for creating launch templates"
  type = map(object({
    ami                   = string
    instance_type         = string
    security_group_names  = list(string)  # Use names instead of IDs
    user_data             = optional(string)
    key_name              = optional(string)
    block_device_mappings = optional(list(map(string)))
  }))
}

variable "security_group_ids_by_name" {
  description = "Map of security group names to their IDs."
  type        = map(string)
}

variable "common_tags" {
  description = "Common tags for all resources created by this module."
  type        = map(string)
}

variable "key_name" {
  description = "Name of the EC2 key pair to associate with instances."
  type        = string
}
