resource "aws_instance" "ec2_ubuntu20_lemp_instance" {
    count  = var.instance_count
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = var.ami_key_pair_name
    security_groups = [aws_security_group.ec2_ubuntu20_lemp_security.id]
    subnet_id = aws_subnet.ec2_ubuntu20_lemp_subnet.id
    
    tags = {
        Name  = "TerraformInst-${count.index + 1}"
        Batch = "5AM"
    }
}