# Terraform Beginner Bootcamp 2023 - Week 1

## Root module structure

Our root module structure is as follows:
```sh
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables
### Terraform Cloud Variables
We have two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file


I set variables on terraform cloud and on my local env.
I set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI(like AWS Credentials).

### Terraform Input Variables
I set some input variables.
See [Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables) for more information.


#### var flag
We can use the -var flag to set an input variable or override a variable in the tfvars file eg.``` terraform -var user_ud="my-user_id"```

#### var-file flag
To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file eg. ```terraform apply -var-file="testing.tfvars"```

#### terraform.tvfars
This is the default file to load in terraform variables in blunk

#### auto.tfvars
recommended ways to specify variable values. Files is automatically loaded by Terraform when you run commands like ```terraform apply``` or t```erraform plan```. 

#### order of terraform variables
Terraform also automatically loads a number of variable definitions files if they are present:

- Files named exactly ```terraform.tfvars``` or ```terraform.tfvars.json```.
- Any files with names ending in ```.auto.tfvars``` or ```.auto.tfvars.json```.



## Terraform import
Imagine we lost our state file. how to have back the state we delete?
In our case we deployed S3 and terraform random
We can import some resources config like S3 to a state file:
```% terraform import aws_s3_bucket.example replace_with_bucket-name```
See [S3 import link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

to import Random config use this command: ```terraform import random_string.bucket_name replace_with_bucket-name```

See [Random import link](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string#import)

## Terraform Module Structure
it's recommended when developing modules to use the directory `modules`
### Modules Sources and passing input variables to a module
We can specify or import a module by using the following code from various places:
```terraform
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  
}
```
As you see, we can also pass input variables to our module.
The module has to declare the terraform variables in its own ```variables.tf``` file

See [Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources

## Considerations when using ChatGPT to write Terraform
LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraform.
It may likely produce older examples that could be deprecated. Often affecting providers.

## Working with Files in Terraform
### Fileexists function
This is a built in terraform function to check the existance of a file.
```sh
condition = fileexists(var.error_html_filepath)
```

See [fileexist link](https://developer.hashicorp.com/terraform/language/functions/fileexists)

### Filemd5
See [Filemd5 link](https://developer.hashicorp.com/terraform/language/functions/filemd5)

### Path Variable
In terraform there is a special variable called path that allows us to reference local paths:

- path.module = get the path for the current module
- path.root = get the path for the root module Special Path Variable

```sh
resource "aws_s3_object" "index_html" { 
    bucket = aws_s3_bucket.website_bucket.bucket 
    key = "index.html" 
    source = "${path.root}/public/index.html" 
}
```

## Terraform Locals
Locals allows us to define local variables. It can be very useful when we need transform data into another format and have referenced a varaible.

```sh
locals {
  s3_origin_id = "MyS3Origin"
}
```
See [Locals link](https://developer.hashicorp.com/terraform/language/values/locals)

## Terraform Data Sources
This allows use to source data from cloud resources.

This is useful when we want to reference cloud resources without importing them.

```sh
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```
See [Data Sources link](https://developer.hashicorp.com/terraform/language/data-sources)

## Working with JSON
We use the jsonencode to create the json policy inline in the hcl.

```sh
> jsonencode({"hello"="world"})
{"hello":"world"}
```
See [Data Sources link](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

### Changing the Lifecycle of resources

See [Meta arguments Lifecycle link](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

### Terraform Data
Plain data values such as Local Values and Input Variables don't have any side-effects to plan against and so they aren't valid in replace_triggered_by. You can use terraform_data's behavior of planning an action each time input changes to indirectly use a plain value to trigger replacement.

See [terraform-data link](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

## Provisioners
Provisioners allow you to execute commands on compute instances eg. a AWS CLI command.

They are not recommended for use by Hashicorp because Configuration Management tools such as Ansible are a better fit, but the functionality exists.

See [Provisioners link](https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax)

### Local-exec
This will execute command on the machine running the terraform commands eg. plan apply
```sh
resource "aws_instance" "web" {
  # ...

  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
  }
}
```
See [Local-exec link](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)

### Remote-exec
This will execute commands on a machine which you target. You will need to provide credentials such as ssh to get into the machine.
```sh
resource "aws_instance" "web" {
  # ...

  # Establishes connection to be used by all
  # generic remote provisioners (i.e. file/remote-exec)
  connection {
    type     = "ssh"
    user     = "root"
    password = var.root_password
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "puppet apply",
      "consul join ${aws_instance.web.private_ip}",
    ]
  }
}
```
See [Remote-exec link](https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec)