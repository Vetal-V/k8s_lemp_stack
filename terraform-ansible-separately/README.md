# Apply LEMP stack using Terraform + Ansible

## Pre Requirements
- Terraform
- Ansible
- Account AWS
  
## Configure environment
- create file `./terraform/variables.tf` with the following content:
```
variable "region" {
  default = "us-east-2"
}

variable "access_key"{
    default = "YOUR_ACCESS_KEY"
}

variable "secret_key"{
    default = "YOUR_SECRET_KEY"
}

variable "ami_id" {
    default = "ami-0a91cd140a1fc148a"
}

variable "ami_key_pair_name" {
    default = "ec2_ubuntu20_lemp_key"
}
```
- in AWS EC2 create key pair (in this example `ec2_ubuntu20_lemp_key`) and save in repo folder `./lemp-stack/terraform-ansible/ansible/ec2_ubuntu20_lemp_key.pem`.

## Run terraform
```
cd terraform
terraform init
terraform apply
```

## Run ansible
- change password for database in [file](https://github.com/Vetal-V/lemp-stack/blob/main/terraform-ansible/ansible/group_var/all/all_vars.yml):
```
mysql_root_password: "mypassword"
```

- prepare hosts file for running playbook:
```
cd ../ansible
chmod +x setup_ansible.sh
./setup_ansible.sh
```

- run ansible playbook:
```
ansible-playbook -i hosts -u ubuntu main.yml
```