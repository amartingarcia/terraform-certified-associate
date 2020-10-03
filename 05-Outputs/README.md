# 05 - Outputs
The _Outputs_ attributes, not only serve to give us information about the resources created.
They can also be consumed by other resources.

In the example we are going to create a group, a user, and the union between them.

1. We create the group
```
terraform apply -target aws_iam_group.developers

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group.developers will be created
  + resource "aws_iam_group" "developers" {
      + arn       = (known after apply)
      + id        = (known after apply)
      + name      = "developers"
      + path      = "/users/"
      + unique_id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_group.developers: Creating...
aws_iam_group.developers: Creation complete after 1s [id=developers]

Warning: Applied changes may be incomplete

The plan was created with the -target option in effect, so some changes
requested in the configuration may have been ignored and the output values may
not be fully updated. Run the following command to verify that no other
changes are pending:
    terraform plan

Note that the -target option is not suitable for routine use, and is provided
only for exceptional situations such as recovering from errors or mistakes, or
when Terraform specifically suggests to use it as part of an error message.


Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

2. Create a user.
```
terraform apply -target aws_iam_user.lb 

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_user.lb will be created
  + resource "aws_iam_user" "lb" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "loadbalancer"
      + path          = "/system/"
      + tags          = {
          + "tag-key" = "tag-value"
        }
      + unique_id     = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.


Warning: Resource targeting is in effect

You are creating a plan with the -target option, which means that the result
of this plan may not represent all of the changes requested by the current
configuration.

The -target option is not for routine use, and is provided only for
exceptional situations such as recovering from errors or mistakes, or when
Terraform specifically suggests to use it as part of an error message.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_user.lb: Creating...
aws_iam_user.lb: Creation complete after 1s [id=loadbalancer]

Warning: Applied changes may be incomplete

The plan was created with the -target option in effect, so some changes
requested in the configuration may have been ignored and the output values may
not be fully updated. Run the following command to verify that no other
changes are pending:
    terraform plan

Note that the -target option is not suitable for routine use, and is provided
only for exceptional situations such as recovering from errors or mistakes, or
when Terraform specifically suggests to use it as part of an error message.


Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

3. Join a user and a group. 
There is a resource called `aws_iam_group_membership`, it allows the union between a user and a group in AWS.

If we look at the documentation:
> The following arguments are supported:
> - name - (Required) The name to identify the Group Membership
> - users - (Required) A list of IAM User names to associate with the Group
> - group - (Required) The IAM Group name to attach the list of users to

Therefore we need the name of the user and the name of the group.

If we look at the creation of the previously created resources, we can see that the output shows us that the resources have a _name_ attribute.
You can refer to that attribute, composing 'resource.name.attribute', for the creation of your resource:

```
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.lb.name,
  ]

  group = aws_iam_group.developers.name
}
```

```
terraform apply                                  
aws_iam_group.developers: Refreshing state... [id=developers]
aws_iam_user.lb: Refreshing state... [id=loadbalancer]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_iam_group_membership.team will be created
  + resource "aws_iam_group_membership" "team" {
      + group = "developers"
      + id    = (known after apply)
      + name  = "tf-testing-group-membership"
      + users = [
          + "loadbalancer",
        ]
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_iam_group_membership.team: Creating...
aws_iam_group_membership.team: Creation complete after 1s [id=tf-testing-group-membership]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## Output object
There is a terraform object, 'output', which allows you to display information about a resource.

```
output "my_user" {
    value = aws_iam_user.lb
}
```

Once declared, we can obtain the output of the resource, with the execution 'terraform output':

```
terraform output 

my_user = {
  "arn" = "arn:aws:iam::363131141369:user/system/loadbalancer"
  "force_destroy" = false
  "id" = "loadbalancer"
  "name" = "loadbalancer"
  "path" = "/system/"
  "tags" = {
    "tag-key" = "tag-value"
  }
  "unique_id" = "AIDAVJDCNPT4RA5UEJGDR"
```

If we look at the file `terraform.tfstate`, we will see how there is a property called `outputs`, in which the outputs of this working directory are defined.

