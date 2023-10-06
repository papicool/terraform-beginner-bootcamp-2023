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
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

/* 
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  error_html_file =  var.error_html_file
  index_html_file =  var.index_html_file
  content_version = var.content_version
  assets_path = var.assets_path
} */
