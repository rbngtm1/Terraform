# Terraform
terraform--provision resources in cloud providers
-- made by hashicorp

--infrastructure as a code
...............................
1. launch ec2
2. wget link on linux
https://www.terraform.io/downloads.html and copy link of 64 and paste it to ec2-linux instance
3. unzip the zipped file (sudo yum install -y unzip in case of rhel)
4. echo $"export PATH=\$PATH:$(pwd)" >> ~/.bash_profile --send current directory and save it to bash_profile
5. source ~/.bash_profile --to load the .bash_profile
6. type terraform , you will see information 
7. mkdir terraform-lab and go inside it
8. vi ec2.tf   (tf is extention for terraform)
* 
       provider "aws" {
         access_key = "***"
         secret_key = "***"
         region     = "us-east-1"
       }

       resource "aws_instance" "example" {
         count         = 2
         ami           = "ami-2757f631"
         instance_type = "t2.micro"


         tags {
           Name = "test-instance"
         }
       }



10. go to Iam, click on user, and go to security credentials and create access key and make changes to ec2.tf
11. note: ami must be specific to region
12. note: once you have aws-cli setup(aws configure) you neednot to provide access_key, secret_key and region.
13.ls , you will see ec2.tf 
14. initialize the terraform by command -- terraform init
13. terraform apply ---- and write yes
15. note: the user should have ec2fullaccess.
16. you can see the changes made by going to ec2-instances, just above ami you need to add count = 2 if you want 2 more machines or so.
17. you can even destroy the changes using command -- terraform destroy
