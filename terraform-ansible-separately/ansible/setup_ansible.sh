#!/bin/bash

path_key=`pwd`'/ec2_ubuntu20_lemp_key.pem'
cd ../terraform
public_ip1=`terraform output -json public_ip | jq '.[0]' | jq '.[0]' | xargs` 
public_ip2=`terraform output -json public_ip | jq '.[0]' | jq '.[1]' | xargs`
public_ip3=`terraform output -json public_ip | jq '.[0]' | jq '.[2]' | xargs`

cd ../ansible/
sed -i "s/IP_ADDRESS1/$public_ip1/" hosts
sed -i "s/IP_ADDRESS2/$public_ip2/" hosts
sed -i "s/IP_ADDRESS3/$public_ip3/" hosts
sed -i "s|PATH_KEY|$path_key|" hosts

cd group_vars/all
sed -i "s/PHP_ADDRESS/$public_ip2/" all_vars.yml
sed -i "s/DB_ADDRESS/$public_ip3/" all_vars.yml