resource "aws_vpc" "ec2_ubuntu20_lemp_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
}

resource "aws_eip" "ec2_ubuntu20_lemp_eip" {
    count  = var.instance_count
    instance = element(aws_instance.ec2_ubuntu20_lemp_instance.*.id, count.index)
    vpc      = true
}

output "public_ip" {
    value = [aws_eip.ec2_ubuntu20_lemp_eip.*.public_ip]
}
