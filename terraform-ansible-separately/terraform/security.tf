resource "aws_security_group" "ec2_ubuntu20_lemp_security" {
    name = "ec2_ubuntu20_lemp_security"
    vpc_id = aws_vpc.ec2_ubuntu20_lemp_vpc.id

    //input rule - allow ports 22, 80, 9000, 3306
    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]

        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 80
        to_port = 80
        protocol = "udp"
    }

    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 9000
        to_port = 9000
        protocol = "tcp"
    }

    ingress {
        cidr_blocks = [
        "0.0.0.0/0"
        ]
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
    }

    //output rule - allow all
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}