# General vars

variable "aws_region" {
  description = "Region To Use For the resources"
  default     = "us-west-2"
}

variable "aws_profile" {
  default = "default"
}

variable "tf_state_bucket" {
  description = "string used to base various names on"
  default     = "pact-terraform"
}

variable "ecr_repo_name" {
  description = "Name of the repository."
  type        = string
  default     = "SecretBatch"
}

variable "tf_state_lock_database" {
  description = "Terraform state lock Database Name"
  default     = "Terraform_State_Lock"
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository. Must be one of: `MUTABLE` or `IMMUTABLE`."
  type        = string
  default     = "MUTABLE"
}

# Image scanning configuration
variable "image_scanning_configuration" {
  description = "Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered. See the ECR User Guide for more information about image scanning."
  type        = map
  default     = {}
}

variable "scan_on_push" {
  description = "Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false)."
  type        = bool
  default     = true
}

# Timeouts
variable "timeouts" {
  description = "Timeouts map."
  type        = map
  default     = {}
}

variable "timeouts_delete" {
  description = "How long to wait for a repository to be deleted."
  type        = string
  default     = null
}

# Policy
variable "policy" {
  description = "Manages the ECR repository policy"
  type        = string
  default     = null
}

# Lifecycle policy
variable "lifecycle_policy" {
  description = "Manages the ECR repository lifecycle policy"
  type        = string
  default     = null
}

# Tags
variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default = {
    "organization" = "PACT Pharma"
    "project"      = "ECR Repositories For Pact Pharma Applications"
    "client"       = "Internal"
    "CreatedBy"    = "Terraform"
    "Application"  = "PACT Java Application"
  }
}
# Encryption type
variable "encryption_type" {
  description = "The encryption type to use for the repository. Valid values are `AES256` or `KMS`"
  type        = string
  default     = "AES256"
}

# KMS key
variable "kms_key" {
  description = "The ARN of the KMS key to use when encryption_type is `KMS`. If not specified when encryption_type is `KMS`, uses a new KMS key. Otherwise, uses the default AWS managed key for ECR."
  type        = string
  default     = null
}
