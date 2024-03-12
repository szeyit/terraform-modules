resource "aws_launch_template" "this" {
  for_each = var.launch_template_configs

  name          = each.key
  image_id      = each.value.ami
  instance_type = each.value.instance_type

  vpc_security_group_ids = [for name in each.value.security_group_names : var.security_group_ids_by_name[name]]

  user_data = each.value.user_data != null ? base64encode(each.value.user_data) : null

  key_name = each.value.key_name

  dynamic "block_device_mappings" {
    for_each = each.value.block_device_mappings != null ? each.value.block_device_mappings : []
    content {
      device_name = block_device_mappings.value.device_name
      ebs {
        volume_size = block_device_mappings.value.volume_size
        volume_type = block_device_mappings.value.volume_type
        delete_on_termination = block_device_mappings.value.delete_on_termination
        encrypted = block_device_mappings.value.encrypted
        // Include other ebs configurations as needed
      }
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        "Name" = each.key
      },
      var.common_tags
    )
  }
}
