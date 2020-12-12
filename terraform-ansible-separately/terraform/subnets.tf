resource "aws_subnet" "ec2_ubuntu20_lemp_subnet" {
    cidr_block = cidrsubnet(aws_vpc.ec2_ubuntu20_lemp_vpc.cidr_block, 3, 1)
    vpc_id = aws_vpc.ec2_ubuntu20_lemp_vpc.id
    availability_zone = var.availability_zone
}

resource "aws_internet_gateway" "ec2_ubuntu20_lemp_gateway" {
    vpc_id = aws_vpc.ec2_ubuntu20_lemp_vpc.id
}

resource "aws_route_table" "ec2_ubuntu20_lemp_route_table" {
    vpc_id = aws_vpc.ec2_ubuntu20_lemp_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ec2_ubuntu20_lemp_gateway.id
    }
}

resource "aws_route_table_association" "ec2_ubuntu20_lemp_route_table_subassociation" {
    subnet_id      = aws_subnet.ec2_ubuntu20_lemp_subnet.id
    route_table_id = aws_route_table.ec2_ubuntu20_lemp_route_table.id
}