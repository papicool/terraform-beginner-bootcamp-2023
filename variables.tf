variable "user_uuid" {
  description = "The UUID of the user"
  type = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type = string
}
variable "index_html_file" {
  description = "Path to the local index.html file to upload to the S3 bucket"
  type        = string
}

variable "error_html_file" {
  description = "Path to the local error.html file to upload to the S3 bucket"
  type        = string
}


variable "content_version" {
  description = "The content version. Should be a positive integer starting at 1."
  type        = number
}