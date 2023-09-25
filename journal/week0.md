# Terraform Beginner Bootcamp 2023 - Week 0
Pre-requis:
    - Jumppad
    - AWS account
    - GIT
    - Terraform cloud
    - Github

## Semantic Versioning


This project is going utilize semantic versioning 2.0.0 for its tagging. [semver.org](https://semver.org)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes


## Install the Terraform CLI
First check your OS version by using the following command:

```sh
$ cat /etc/os-release
```
Mine is ubuntu 22.04.

I install Terraform by adding the follow instruction for linux :

```sh
      sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
      wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
      gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
      echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
      sudo apt-get update && sudo apt-get install terraform
```

I add these lines on my .gitpod.yml file

