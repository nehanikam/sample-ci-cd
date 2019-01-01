output "instance" {
  value = "${aws_instance.jenkins.public_ip}"
}
