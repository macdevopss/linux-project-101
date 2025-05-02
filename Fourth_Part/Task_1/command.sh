#!/bin/bash

# JSON dosyasından IP'yi al
IP=$(jq -r '.Instances[0].PrivateIpAddress' info.json)

# terraform.tf içinde 40. satırdaki ec2_private_ip satırını değiştir
sed -i "40s/.*/  ec2_private_ip = \"${IP}\"/" terraform.tf

# Bilgi mesajı
echo "IP güncellendi: ${IP}"
