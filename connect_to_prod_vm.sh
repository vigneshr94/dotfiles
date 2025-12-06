#!/bin/bash


read -p "Enter the jump host Public IP: " jumphost_ip

read -p "Enter the VM private IP: " vm_ip

read -p "ssh filename: " file_name
read -p "vm username: " username

echo Jump Host IP is $jumphost_ip
echo VM IP is $vm_ip
echo SSH Key file name $file_name

echo enabling ssh agent

eval $(ssh-agent -s) && ssh-add "/Users/$USER/.ssh/$file_name"

echo connecting to jumphost
ssh -p 5322 -i "/Users/$USER/.ssh/$key_path" -A $username@$jumphost_ip
