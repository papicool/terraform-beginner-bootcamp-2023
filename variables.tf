variable "teacherseat_user_uuid" {
  description = "The UUID of the user"
  type = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type = string
}

variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "godOfWar" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "fifa23" {
  type = object({
    public_path = string
    content_version = number
  })
}