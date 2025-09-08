resource "aws_security_group" "redshift_sg" {
  name        = "${var.project}-redshift-sg"
  description = "Allow Redshift access"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Redshift from anywhere (dev only)"
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ⚠️ Dev only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Lookup default VPC
data "aws_vpc" "default" {
  default = true
}

# ✅ Updated to aws_subnets (instead of aws_subnet_ids)
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_redshift_cluster" "main" {
  cluster_identifier     = "${var.project}-redshift"
  database_name          = var.redshift_database_name
  master_username        = var.redshift_master_username
  master_password        = var.redshift_master_password
  node_type              = var.redshift_node_type
  cluster_type           = "single-node"
  iam_roles              = [aws_iam_role.redshift.arn]
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.redshift_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name = "${var.project}-redshift"
  }
}
