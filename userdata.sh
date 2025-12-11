#!/bin/bash

dnf install python3.13-pip -y
pip3.11 install ansible
ansible-pull -i localhost, -U https://github.com/raghudevopsb87/roboshop-ansible-templates.git main.yml -e component=${component} -e env=${env}
