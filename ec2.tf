provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08e5424edfe926b43"
  instance_type = "t2.medium"
  key_name      = "koko.pem"
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
    sudo docker pull jenkins/jenkins

    # Start Jenkins
    docker run -d -p 8080:8080 -p 50000:50000 --name jenkins jenkins/jenkins
  EOF
}
