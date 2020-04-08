# _Terraform Module : terraform-module-aws-autoscaling-group_


## _General_

_This module may be used to create_ **_EC2 AutoScalling Group_** _resources in AWS cloud provider....._

---


## _Prerequisites_

_This module needs_ **_Terraform 0.12.19_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._


---


## _Features Branches_

_Below we are able to check the resources that are being created as part of this module call:_

* **_EC2 AutoScalling Group_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

_Example with_ **_launch\_tamplate_**

```tf
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }

  name_prefix               = "ec2-asg-"
  desired_capacity          = 1
  max_size                  = 1
  min_size                  = 0
  default_cooldown          = 1
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_grace_period = 1
  launch_template           = {
      id      = var.launch_template_id
      version = "$Latest"
  }
  tags                      = merge(var.common_tags, map(
    "Name", "ec2-autoscaling-group"
  ))
}

```

_Example with_ **_mixed\_instances\_policy_**

```tf
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=terraform-12/master"

  providers = {
    aws = aws.services
  }
  
  name_prefix               = "ec2-asg-"
  desired_capacity          = 0
  max_size                  = 0
  min_size                  = 0
  default_cooldown          = 1
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_grace_period = 1
  launch_template           = {}
  mixed_instances_policy    = {
      launch_template = {
          launch_template_specification = {
              launch_template_id = var.launch_template_id
              version            = "$Latest"
          }

          override = [
              {
                  instance_type = "m4.large"
              },
              {
                  instance_type = "t3.large"
              }
          ]
      }
      instances_distribution = {
          spot_allocation_strategy                 = "capacity-optimized"
          on_demand_base_capacity                  = 0
          on_demand_percentage_above_base_capacity = 0
      }
  }
  tags                      = merge(var.common_tags, map(
    "Name", "ec2-autoscaling-group"
  ))
}

```
---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|
| **_name\_prefix_** | Creates a unique name | _string_ | **_Required_** |
| **_desired\_capacity_** | The number of Amazon EC2 instances | _string_ | **_Required_** |
| **_max\_size_** | The maximum size | _string_ | **_Required_** |
| **_min\_size_** | The minimum size | _string_ | **_Required_** |
| **_default\_cooldown_** | The amount of time, in seconds | _string_ | **_Optional (Default - 60)_** |
| **_health\_check\_type_** | Type of health check | string | **_Optional (Default - EC2)_** |
| **_force\_delete_** | Allows deleting the autoscaling group | _string_ | **_Optional (Default - true)_** |
| **_vpc\_zone\_identifier_** | A list of subnet IDs to launch resources | _list(string)_ | **_Required_** |
| **_target\_group\_arns_** | A list of aws_alb_target_group ARNs | _list(string)_ | **_Optional_** |
| **_health\_check\_grace\_period_** | Time (in seconds) after instance comes | _string_ | **_Optional (Default - 300)_** |
| **_suspended\_processes_** | A list of processes to suspend | _list(string)_ | **_Optional_** |
| **_tags_** | A list of tag blocks | _map(string)_ | **_Required_** |
| **_mixed\_instances\_policy_** | Configuration block | _any_ | **_Optional_** |
| **_launch\_template_** | Nested argument with Launch template | _map(string)_ | **_Required_** |



## _Outputs_

* **_id_**
* **_name_**
* **_arn_**



### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
data.terraform_remote_state.<module_name>.<output_variable_name>
```


## Authors
_Module maintained by Module maintained by the -_ **_Nitin Das_**