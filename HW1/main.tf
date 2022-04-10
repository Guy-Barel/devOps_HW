terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}

# Create a VPC
resource "aws_vpc" "GuyBarel" {
  cidr_block = "192.246.10.0/24"
  tags={
    "name" = "Guy's vpc"
  }
  

}

resource "aws_subnet" "Web_Tier_Subnet" {
  vpc_id     = aws_vpc.GuyBarel.id
  cidr_block = "192.246.10.0/27"
  tags={
    "name" = "Guy's Web Tier Subnet"
  }
}

resource "aws_subnet" "App_Tier_Subnet" {
  vpc_id = aws_vpc.GuyBarel.id
  cidr_block = "192.246.10.32/27"
  tags={
    "name" = "Guy's App Tier Subnet"
  }
  
}

resource "aws_subnet" "DB_Tier_Subnet" {
  vpc_id = aws_vpc.GuyBarel.id
  cidr_block = "192.246.10.64/28"
  tags={
    "name" = "Guy's DB Tier Subnet"
  }
  
}