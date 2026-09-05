terraform {
  #backend block where terraform statefile will store 
  #it will store in s3 bucket and it is called remote statefile
  backend "s3" {
   bucket = "terraform-idream-tffile-bk"
   key = "dev/terraform.tfstate"
   region = "ap-south-1"
   encrypt = true
   #use_lockfile = true
}
#provider block 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}
# it will create s3 bucket in aws 
resource "aws_s3_bucket" "idream-bk" {
bucket = "idreamit-bucket-1234567-bk-terraform"
 tags = {
  Name = "Qa-bucket-idream"
  Environment = "Qa"
 }
}
# it will create linux-os  in aws 
resource "aws_instance" "mylinuxos"{
 ami = "ami-094210f044117049d"
 instance_type = "t2.micro"
 tags = {
    Name = "Qa_mylinuxos"
	Environment = "var.environment"
 }
 
}