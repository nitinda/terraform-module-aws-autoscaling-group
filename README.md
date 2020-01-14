# Terraform Module Name: terraform-module-aws-autoscaling-group


## General

This module may be used to create **_EC2 AutoScalling Group_** resources in AWS cloud provider..

---


## Prerequisites

This module needs **_Terraform 0.11.14_** or newer.
You can download the latest Terraform version from [here](https://www.terraform.io/downloads.html).

This module deploys aws services details are in respective feature branches.

---


## Features Branches

Below we are able to check the resources that are being created as part of this module call:

* **_EC2 AutoScalling Group_**


---

## Usage

## Using this repo

To use this module, add the following call to your code:

```tf
module "<layer>-efs-<AccountID>" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=master"

  providers = {
    aws = "aws.services"
  }


}
```
---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|




## Outputs

* **_id_**
* **_name_**
* **_arn_**


Details are in respective branch.


### Usage
In order for the variables to be accessed on module level please use the syntax below:

```tf
module.<module_name>.<output_variable_name>
```

- The output variable is able to be accessed through terraform state file using the syntax below:

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```


## Authors
Module maintained by Module maintained by the - **_Nitin Das_**
