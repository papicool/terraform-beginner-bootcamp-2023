output "bucket_name" {
  description = "bucket_name from our static website"
  value = module.terrahouse_aws.bucket_name
}

output "S3_website_endpoint" {
  description = "website_endpoint of our static website"
  value = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}