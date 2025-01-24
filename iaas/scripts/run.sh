#!/bin/bash
terraform init -upgrade
terraform plan -out main.tfplan
terraform apply main.tfplan
ansible-playbook -i ../ansible/inventory.ini ../ansible/playbook.yml