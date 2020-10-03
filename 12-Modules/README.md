# 12 - Modules
There is a principle in the development of the software, __Don't Repeat Yourself__ or __DRY__, its main objective is to avoid the duplication of code.

Using __modules_ from Terraform, we avoid repeating code, allowing reuse.

The modules are parameterised to allow their use in various cases. Let's look at some examples:

In the modules directory there is a definition of an EC2 resource, which is invoked in this way, from the _project_ directory:

```
module "ec2module" {
    source = "../modules/ec2"
    instance_type = "t2.large
}
```

