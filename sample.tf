provider "aws" {
	region = "us-east-1"
        shared_credentials_file = "/home/aalem/.aws/credentials"
}

resource "aws_key_pair" "sample-demo" {
  key_name   = "sample-demo"
  public_key = file("/home/aalem/mygo/sample.pub")
}

resource "aws_instance" "my-instance" {
        vpc_id = "vpc-01f7626a3c406800e"
        subnet = "subnet-09bfe0f1c2e40beec" 
	ami = "ami-0742b4e673072066f"
	instance_type = "t2.nano"
	key_name = aws_key_pair.sample-demo.key_name
	user_data = file("/home/aalem/mygo/sample")
	tags = {
		Name = "Terraform"	
	}
}
