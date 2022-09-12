output "public_ip" {
  value = aws_instance.jumpbox.public_ip
}

output "cluster_ips" {
  description = "Should be a list of cluster IPs"
  value = join(",", aws_instance.galera_db[*].private_ip)
}