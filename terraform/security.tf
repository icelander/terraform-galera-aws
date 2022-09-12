# Create Security Group for the Bastion Host aka Jump Box
# terraform aws create security grou
resource "aws_security_group" "ssh-security-group" {
  name = "SSH Security Group"
  description = "Enable SSH access on Port 22"
  vpc_id = aws_vpc.vpc.id
  ingress {
    description = "All Access"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.ssh-location}"]
    self = true
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self = true
  }

  tags = {
    Name = "SSH Security Group"
  }
}