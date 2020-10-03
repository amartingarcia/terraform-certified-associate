# 06 - Outputs v2
We may work with different work directories, by organization, for any other reason.
It is possible that resources located in different working directories, and therefore different 'terraform.tfstate' files, may need to consume data from other 'fstate'.

We present the following scenario:
1. In the 'Dir1' we will create the group, and we will expose the name of the group through the output.
2. In the 'Dir2', we will create the user and the union, and we will consult the output of another 'tfstate'.
3. We introduce another type of object, the `data sources`, which allows us to obtain data from external sources. In our case, we need to obtain the name of the group that has been created in dir1.
4. The syntax to obtain the outputs from another tfstate, `data.terraform_remote_state.resource_tag.outputs.name_of_the_output`.