output "instance_ids" {
  value = { for inst_key, inst in aws_instance.this : inst_key => inst.id }
}

output "instance_public_ips" {
  value = { for inst_key, inst in aws_instance.this : inst_key => inst.public_ip }
}
