terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
#  backend "remote" {
#    hostname = "app.terraform.io"
#    organization = "MyTerraformBootcamp"
#
#    workspaces {
#      name = "terra-house-1"
#    }
#  }


#   cloud {
#     organization = "MyTerraformBootcamp"
# 
#     workspaces {
#       name = "terra-house-1"
#     }
#   }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid
  token=var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid= var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  error_html_file =  var.error_html_file
  index_html_file =  var.index_html_file
  content_version = var.content_version
  assets_path = var.assets_path
} 

resource "terratowns_home" "home" {
  name = "How to play God of War in 2023!"
  description = <<DESCRIPTION
Many years have passed since Kratos took his revenge against the Olympian gods.
Having survived his last encounter with his father Zeus,
Kratos has since traveled to Midgard in ancient Norway 
and now lives with his young son Atreus in the world of the Norse gods,
a wild land inhabited by many fierce monsters and warriors. 
To teach his son, whose mother and Kratos' second wife recently died, how to survive in such a world,
Kratos must master the rage that has driven him for many years and embrace his new role as father and mentor.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "missingo"
  content_version = 1
}