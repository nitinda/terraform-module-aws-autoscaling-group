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
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=terraform-11/master"

  providers = {
    aws = "aws.services"
  }
  
  name_prefix               = "demo-asg-ec2-"
  desired_capacity          = 5
  common_tags               = "${var.common_tags}"
  max_size                  = 5
  min_size                  = 0
  default_cooldown          = 1
  force_delete              = true
  health_check_type         = "EC2"
  vpc_zone_identifier       = ["${var.vpc_zone_identifier}"]
  health_check_grace_period = 1
  suspended_processes       = []
  override_instance_types   = "${var.asg_override_instance_types}"
  launch_template_specification = [
    {
      launch_template_id = "${var.launch_template_id}"
      version            = "$$Latest"
    }
  ]
  instances_distribution    = "${var.instances_distribution}"
  tags                      = "${merge(var.common_tags, map(
    "Name", "demo-asg-ec2-worker-nodes"
  ))}"

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
