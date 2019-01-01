resource "aws_instance" "jenkins" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  # the security group
  vpc_security_group_ids = ["${aws_security_group.instance-sg.id}"]

  # the public SSH key
  key_name = "${aws_key_pair.mykeypair.key_name}"


  tags {
    Name = "sephora-ci-cd"
  }

  provisioner "file" {
    source = "install.sh"
    destination = "/tmp/install.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "sudo /tmp/install.sh"
    ]
  }
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
