resource "aws_instance" "jumpbox" {
  ami = "ami-08882eba49067074f" # Rocky Linux
  instance_type = "${var.jump_instance_type}"
  key_name = var.aws_key_name

  security_groups = ["${aws_security_group.ssh-security-group.id}"]
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true

  connection {
    type = "ssh"
    host = self.public_ip
    user = "rocky"
    private_key = file(var.ssh_key_path)
    timeout = "4m"
  }

  provisioner "file" {
    source = var.ssh_key_path
    destination = "/home/rocky/.ssh/id_rsa"
  }

  provisioner "remote-exec" {
    inline = ["chmod 400 /home/rocky/.ssh/id_rsa"]
  }

  lifecycle {
    create_before_destroy = true
  }
  
  tags = {
    "Name" = "galera-jump"
  }
}  

resource "aws_instance" "galera_db" {
  count = var.db_instance_count
  ami = "ami-05a36e1502605b4aa" # CentOS 7
  instance_type = "${var.db_instance_type}"
  key_name = var.aws_key_name
  security_groups = ["${aws_security_group.ssh-security-group.id}"]
  subnet_id = "${aws_subnet.public-subnet-1.id}"
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    "Name" = "galera-${count.index + 1}"
  }
}