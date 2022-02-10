
resource "aws_vpc_endpoint" "ssm_messages" {
  
  vpc_id            = var.vpc_id 
  service_name      = "com.amazonaws.${var.aws_region}.ssmmessages"
  subnet_ids        = [ var.subnet_id ]
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true

  security_group_ids  = var.security_group_ids 
  
  tags = {
    Name = "ssm-messages"
    Environment = "ssm-messages"
  }

}


resource "aws_vpc_endpoint" "ssm_endpoint" {
  
  vpc_id            = var.vpc_id 
  service_name      = "com.amazonaws.${var.aws_region}.ssm"
  subnet_ids        = [ var.subnet_id ]
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true

  security_group_ids  = var.security_group_ids 
  
  tags = {
    Name = "ssm-test"
    Environment = "ssm-test"
  }

}


resource "aws_vpc_endpoint" "ssm_ssm-incidents" {
  
  vpc_id            = var.vpc_id 
  service_name      = "com.amazonaws.${var.aws_region}.ssm-incidents"
  subnet_ids        = [ var.subnet_id ]
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true

  security_group_ids  = var.security_group_ids 
  
  tags = {
    Name = "ssm-incidents"
    Environment = "ssm-incidents"
  }

}


resource "aws_vpc_endpoint" "s3_endpoint" {
  
  vpc_id            = var.vpc_id 
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  tags = {
    Environment = "test"
  }

}

resource "aws_vpc_endpoint_route_table_association" "s3-endpoint-example" {
  route_table_id  = var.route_table 
  vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint.id
}

output "endpoints" {
  description = "Array containing the full resource object and attributes for all endpoints created"
  value       = aws_vpc_endpoint.s3_endpoint
}

