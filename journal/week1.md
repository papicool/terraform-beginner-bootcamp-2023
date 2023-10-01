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
