provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "instance" {
  name_prefix = "instance"
  vpc_id      = "vpc-0d06637f2a053fd07"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cka"
  }
}


resource "aws_instance" "example" {
  count        = 3
  ami = "ami-005f9685cb30f234b"
  # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type
  instance_type = "t3a.medium"
  # t3.medium	2	4.0	
  subnet_id    = "subnet-07f29549bc4714dfb"
  security_groups = [aws_security_group.instance.id]
  key_name      = "cka"

  user_data = <<-EOF
              #!/bin/bash
              yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
              systemctl start amazon-ssm-agent
              systemctl enable amazon-ssm-agent
              EOF
  
  tags = {
    Name = "cka-instance-${count.index+1}"
  }
}