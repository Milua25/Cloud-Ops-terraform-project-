
# Create an IAM role
resource "aws_iam_role" "s3-account2-role" {
name        = "s3-account-2-role"
description = "role to give account 1 direct access to s3"
assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "AWS": "${var.account_id}" 
            },
            "Condition": {}
        }
    ]
})

tags = {
stack = "S3-direct-access-Role"
}
}

variable "account_id" {
  description = "Please enter account 1's id"
}

resource "aws_iam_role_policy_attachment" "s3-full-access-policy" {
role       = aws_iam_role.s3-account2-role.name
policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"

}

output "s3-iam-role-account-2" {
  value = aws_iam_role.s3-account2-role.arn
}
