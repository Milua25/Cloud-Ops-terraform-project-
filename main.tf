
module "s3" {
  source = "./s3"
  s3-bucket-name = var.aws_s3_bucket 
  account_id = var.account_1_id 
  
  providers = {
    aws = aws.Account-2
  }

}

module "iam-profile" {
  source         = "./iam-profile"
  s3-arn-account-2 = module.s3.s3-iam-role-account-2
}

module "vpc" {
  source = "./vpc"
  availability_zone_private =  var.availability_zone_private 
  availability_zone_public = var.availability_zone_public 
  aws_region = var.region 
}

module "sg" {
  source     = "./sg"
  vpc_id     = module.vpc.vpc_id
  aws_region = var.region
}

module "web" {
  source             = "./web"
  availability_zone  = module.vpc.private_subnet_az
  security_group     = [module.sg.sg_id]
  subnet_id          = module.vpc.private_subnet
  subnet_id_public   = module.vpc.public_subnet
  security_group_ids = [module.sg.sg_id]
  vpc_id             = module.vpc.vpc_id
  aws_region         = var.region
  instance_profile   = module.iam-profile.aws_iam_instance_profile
  route_table =  module.vpc.route_table 
}

output "PrivateIP" {
  value = module.web.private_ip
}
