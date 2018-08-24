#!/bin/bash

#exit if a command fails
set -e

sudo yum install -y epel-release || { echo "Could not install EPEL."; exit 1; }
sudo yum install -y git || { echo "Could not install Git."; exit 1; }
sudo yum install -y yum-utils device-mapper-persistent-data lvm || { echo "Could not install LVM."; exit 1; }
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo || { echo "Could not add the Docker CE repo."; exit 1; }
sudo yum install -y docker-ce || { echo "Could not install Docker CE."; exit 1; }
sudo systemctl start docker || { echo "Could not start Docker."; exit 1; }
sudo systemctl enable docker || { echo "Could not enable Docker."; exit 1; }
