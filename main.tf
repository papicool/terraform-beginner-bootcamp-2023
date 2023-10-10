terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
/*   backend "remote" {
    hostname = "app.terraform.io"
    organization = "MyTerraformBootcamp"

    workspaces {
      name = "terra-house-1"
    }
  } */


   cloud {
     organization = "MyTerraformBootcamp"
 
     workspaces {
       name = "terra-house-1"
     }
   }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid= var.teacherseat_user_uuid
  token=var.terratowns_access_token
}

module "home_godofwar_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid= var.teacherseat_user_uuid
  public_path =  var.godOfWar.public_path
  content_version = var.godOfWar.content_version
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
  domain_name = module.home_godofwar_hosting.domain_name
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = var.godOfWar.content_version
}

module "home_fifa23_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid= var.teacherseat_user_uuid
  public_path =  var.fifa23.public_path
  content_version = var.fifa23.content_version
} 

resource "terratowns_home" "home_fifa23" {
  name = "How to play FIFA 2023!"
  description = <<DESCRIPTION
FIFA 23 is a football video game published by EA Sports. 
It is the 30th installment in the FIFA series that is developed by EA Sports,
the final installment under the FIFA banner, and released worldwide on 30 September 2022 for Nintendo Switch,
PlayStation 4, PlayStation 5, Windows, Xbox One and Xbox Series X/S.
DESCRIPTION
  domain_name = module.home_fifa23_hosting.domain_name
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = var.fifa23.content_version
} 