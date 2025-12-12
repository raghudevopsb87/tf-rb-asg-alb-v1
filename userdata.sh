#!/bin/bash

#dnf install python3.13-pip -y # Commented because these installation was done in golden image
#pip3.11 install ansible # Commented because these installation was done in golden image
ansible-pull -i localhost, -U https://github.com/raghudevopsb87/roboshop-ansible-templates.git main.yml -e component=${component} -e env=${env} | tee /root/user-data.log
