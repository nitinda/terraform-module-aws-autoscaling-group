# _Terraform Module : terraform-module-aws-autoscaling-group_


## _General_

_This module may be used to create_ **_EC2 AutoScalling Group_** _resources in AWS cloud provider......._

---


## _Prerequisites_

_This module needs_ **_Terraform 0.11.14_** _or newer._
_You can download the latest Terraform version from_ [_here_](https://www.terraform.io/downloads.html).

_This module deploys aws services details are in respective feature branches._

---


## _Features_

_Below we are able to check the resources that are being created as part of this module call:_

_From branch :_ **_terraform-11/master_**
* **_EC2 AutoScalling Group_**


_From branch :_ **_terraform-12/master_**
* **_EC2 AutoScalling Group_**


---

## _Usage_

## _Using this repo_

_To use this module, add the following call to your code:_

```tf
module "autoscaling_group" {
  source = "git::https://github.com/nitinda/terraform-module-aws-autoscaling-group.git?ref=master"

  providers = {
    aws = "aws.services"
  }


}
```
---

## _Inputs_

_The variables required in order for the module to be successfully called from the deployment repository are the following:_


|**_Variable_** | **_Description_** | **_Type_** | **_Argument Status_** |
|:----|:----|-----:|-----:|




## _Outputs_

* **_id_**
* **_name_**
* **_arn_**


_Details are in respective branch._

### _Usage_

_In order for the variables to be accessed on module level please use the syntax below:_

```tf
module.<module_name>.<output_variable_name>
```

_The output variable is able to be accessed through terraform state file using the syntax below:_

```tf
"${data.terraform_remote_state.<module_name>.<output_variable_name>}"
```


## _Authors_
_Module maintained by Module maintained by the -_ **_Nitin Das_**
