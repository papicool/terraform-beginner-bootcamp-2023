# Terraform Beginner Bootcamp 2023 - Week 2
## Setup Skeleton For Custom Terraform Provider

I import this terratowns_mock_server project https://github.com/ExamProCo/terratowns_mock_server.git

```sh
https://github.com/ExamProCo/terratowns_mock_server.git
cd terratowns_mock_server
rm -rf .git
```

## Working with Ruby
### Bundler
Bundler is a package manager for runy. It is the primary way to install ruby packages (known as gems) for ruby.

### Install Gems
You need to create a Gemfile and define your gems in that file.

```sh
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
Then you need to run the `bundle install` command

This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A `Gemfile.lock ` will be created to lock down the gem versions used in this project.

### Executing ruby scripts in the context of bundler
We have to use bundle exec to tell future ruby scripts to use the gems we installed. This is the way we set context.

## Sinatra
Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

https://sinatrarb.com/

## Terratowns Mock Server
### Running the web server
We can run the web server by executing the following commands:
```sh
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the server.rb file.

## Terraform Provider for Terratowns
I create the terraform-provider-terratowns directory contening : main.go , go.mod
I also create a bash script named `build_provider` to install all packages and dependencies

## CRUD
Terraform Provider resources utilize CRUD.

CRUD stands for Create, Read Update, and Delete

[See CRUD on wikipedia](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)


## Result


![terrahome](images/Screenshot%202023-10-09%20at%2003.05.19.png)

![terrahome](images/Screenshot%202023-10-09%20at%2003.05.40.png)


![terrahome](images/Screenshot%202023-10-09%20at%2003.06.31.png)


![terrahome](images/Screenshot%202023-10-09%20at%2003.06.43.png)