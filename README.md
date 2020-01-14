# Terraform Module Name: terraform-module-aws-autoscaling-group


## General

This module may be used to create **_EC2 AutoScalling Group_** resources in AWS cloud provider..

---


## Prerequisites

This module needs **_Terraform 0.12.19_** or newer.
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
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }


}
```
---

## Inputs

The variables required in order for the module to be successfully called from the deployment repository are the following:


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name\_prefix_** | Creates a unique name | _string_ |
| **_desired\_capacity_** | The number of Amazon EC2 instances | _string_ |
| **_max\_size_** | The maximum size | _string_ |
| **_min\_size_** | The minimum size | _string_ |
| **_default\_cooldown_** | The amount of time, in seconds | _string_ |
| **_health\_check\_type_** | Type of health check | string          |
| **_force\_delete_** | Allows deleting the autoscaling group | _string_ |
| **_vpc\_zone\_identifier_** | A list of subnet IDs to launch resources | _list_ |
| **_target\_group\_arns_** | A list of aws_alb_target_group ARNs | _list_ |
| **_health\_check\_grace\_period_** | Time (in seconds) after instance comes | _string_ |
| **_suspended\_processes_** | A list of processes to suspend | _list_ |
| **_tags_** | A list of tag blocks | map |
| **_override\_instance\_types_** | The size of instance to launch | _list_ |
| **_launch\_template\_specification_** | Nested argument defines the LC | _list of maps_ |
| **_instances\_distribution_** | Nested argument containing settings | _list of maps_ |
| **_common\_tags_** | Common tags | _map_ |




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
