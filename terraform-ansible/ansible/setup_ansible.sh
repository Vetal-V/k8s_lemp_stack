#!/bin/bash

path_key=`pwd`'/ec2_ubuntu20_lemp_key.pem'
cd ../terraform
public_ip=`terraform output public_ip`

cd ../ansible/
sed -i "s/IP_ADDRESS/$public_ip/" hosts
sed -i "s|PATH_KEY|$path_key|" hosts
