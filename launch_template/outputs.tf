output "launch_template_ids" {
  value = { for lt in aws_launch_template.this : lt.name => lt.id }
}

output "launch_template_latest_versions" {
  value = { for lt in aws_launch_template.this : lt.name => tostring(lt.latest_version) }
}
