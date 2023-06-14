provider "aws" {
  region = "<AWS_REGION>"
}

resource "aws_instance" "example" {
  ami           = "<AMI_ID>"
  instance_type = "<INSTANCE_TYPE>"
  key_name      = "<KEY_PAIR_NAME>"
  tags = {
    Name = "Jenkins-EC2-Instance"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo usermod -a -G docker ubuntu
    sudo systemctl start docker
    sudo systemctl enable docker

    # Retrieve the Docker image
    sudo docker pull your-docker-image

    # Deploy the Kubernetes manifest
    sudo kubectl apply -f /deployment.yaml
  EOF
}
