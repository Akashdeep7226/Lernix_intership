#!/bin/bash

echo "===== Learnix Labs Task3 Setup ====="

set apt update

sudo apt install -y python3 nginx ufw

mkdir -p data
mkdir -p logs

sudo cp dummyapp.service /etc/systemd/system

sudo cp nginx.conf /etc/nginx/sites-available/dummyapp

sudo ln -sf /etc/nginx/sites-available/dummyapp /etc/nginx/sites-enabled/dummyapp
sudo rm -f /etc/nginx/sites-enabled/default

sudo systemctl enable dummyapp
sudo systemctl restart dummyapp

sudo nginx -t
sudo systemctl restart nginx

sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw --force enable

echo "==================="
echo "Setup Successfully"
echo "==================="

echo "Test application"
echo "curl http://localhost"