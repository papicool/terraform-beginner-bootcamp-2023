output "bucket_name" {
  description = "bucket_name from our static website"
  value = module.home_godofwar_hosting.bucket_name
}

output "website_endpoint" {
  description = "website_endpoint of our static website"
  value = module.home_godofwar_hosting.website_endpoint
}

output "domain_name" {
  description = "The CloudFront Distribution Domain Name"
  value = module.home_godofwar_hosting.domain_name
} 