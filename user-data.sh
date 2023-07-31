#!/bin/bash

sudo yum install -y docker

sudo systemctl start docker

sudo systemctl enable docker

sudo usermod -aG docker ec2-user

aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${aws_ecr_url}

docker pull ${aws_ecr_url}/${aws_repository_name}:latest

docker run -d -p 8080:8080 ${aws_ecr_url}/${aws_repository_name}

