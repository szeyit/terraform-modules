resource "aws_instance" "this" {
  for_each = var.instances_configs

  subnet_id          = each.value.subnet_id
  security_groups    = [for sg_name in each.value.security_group_names : var.security_group_ids_by_name[sg_name]]
  user_data          = lookup(each.value, "user_data", null)

  # Use the launch template ID from the passed variable
  launch_template {
    id      = var.launch_template_ids[each.value.launch_template_name]
    version = lookup(each.value, "launch_template_version", "$Latest")
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = each.key
    },
    each.value.tags
  )
}
