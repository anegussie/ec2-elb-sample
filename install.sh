#!/bin/bash




git clone https://github.com/anegussie/ec2-elb-sample.git
cd ec2-elb-sample

make clean

make 

terraform init

terraform plan

terraform apply 
