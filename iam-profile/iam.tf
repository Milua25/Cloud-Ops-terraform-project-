# Create an IAM role
resource "aws_iam_role" "ec2-resources-iam-role" {
name        = "ec2-ssm-role"
description = "giving required permissions to EC2 instance"
assume_role_policy = "${file("./iam-profile/assume-policy.json")}"
   
inline_policy {
     name = "my_inline_policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["sts:AssumeRole"]
          Effect   = "Allow"
          Resource = ["${var.s3-arn-account-2}"]
        },
      ]
    })   
}
tags = {
stack = "SSM-Role"
}
}


variable "s3-arn-account-2" {
  description = "value"
}

resource "aws_iam_instance_profile" "ec2-resources-iam-profile" {
name = "s3_profile"
role = aws_iam_role.ec2-resources-iam-role.name

}

resource "aws_iam_role_policy_attachment" "ec2-resources-ssm-policy" {
role       = aws_iam_role.ec2-resources-iam-role.name
policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_role_policy_attachment" "ec2-resources-ssm-policy-test" {
role       = aws_iam_role.ec2-resources-iam-role.name
policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_role_policy_attachment" "ec2-resources-s3-policy-full" {
role       = aws_iam_role.ec2-resources-iam-role.name
policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

output "aws_iam_instance_profile" {
  value = aws_iam_instance_profile.ec2-resources-iam-profile.name
}

