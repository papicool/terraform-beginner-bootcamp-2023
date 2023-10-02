output "bucket_name" {
  description = "bucket_name from our static website"
  value = module.terrahouse_aws.bucket_name
}

output "website_endpoint" {
  description = "website_endpoint of our static website"
  value = module.terrahouse_aws.website_endpoint
}