variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project prefix/name"
  type        = string
  default     = "retail-proposal"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "redshift_master_username" {
  description = "Redshift master user"
  type        = string
  default     = "awsuser"
}

variable "redshift_master_password" {
  description = "Redshift master password"
  type        = string
  sensitive   = true
}

variable "redshift_node_type" {
  description = "Redshift node type"
  type        = string
  default     = "ra3.xlplus"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for raw CSVs"
  type        = string
  default     = null
}

variable "redshift_database_name" {
  description = "Default database name created inside Redshift"
  type        = string
  default     = "dev"
}