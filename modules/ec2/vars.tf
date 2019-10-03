variable "ami_id"{}

variable "ec2_count"{
    default= 1
}

variable "instance_type"{
    default= "t2.micro"
}

variable "subnet_id"{}