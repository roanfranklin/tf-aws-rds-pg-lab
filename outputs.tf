# Output the ID of the RDS instance
output "rds_instance_id" {
  value = "${aws_db_instance.rds_pg.id}"
}

# Output the address (aka hostname) of the RDS instance
output "rds_instance_address" {
  value = "${aws_db_instance.rds_pg.address}"
}

# Output endpoint (hostname:port) of the RDS instance
output "rds_instance_endpoint" {
  value = "${aws_db_instance.rds_pg.endpoint}"
}

# # Output the ID of the Subnet Group
# output "subnet_group_id" {
#   value = "${aws_db_subnet_group.main_db_subnet_group.id}"
# }

# # Output DB security group ID
# output "security_group_id" {
#   value = "${aws_security_group.main_db_access.id}"
# }