# STEPS
- ```vi terraform.tfvars```
- gathered the following info:
  ```
  # parent tenancy_ocid
  oci iam compartment list | jq '.data[0]."compartment-id"'
 
  # user ocid
  # Using jq, I only selected the first item. Yours might be different
  oci iam user list | jq '.data[0] | .id'

  # fingerprint is part of the config
  cat ~/.oci/config | get -i fingerprint

  # region in the config
  cat ~/.oci/config | grep -i region
	 
  # the selected compartment
  oci network vcn list -c  | jq '.data[] | select(."display-name"|match("<insert-text-here>")) | ."display-name", .id'

  # the vcn 
  oci network vcn list -c <name-of-compartment> 

  # the selected public subnet you want the compute to be assigned to
  oci network subnet list -c <name-of-compartment>

  # select the image for your compute
  oci compute image list -c <name-of-compartment> 
  ```
- create the variables.tf file referencing the values above
- grab the availability domain data source. It is a requried argument for our compute instance 
- create the providers.tf file to statically assign the provider and assign the variables to the provider information
- ```terraform init```
  - makes the .terraform folder
  - makes the lock file  
  - makes a terraform.state file
- ```terraform plan```
- if all looks good, ```terraform apply```
- create outputs.tf so you can see the attributes to your resources and data sources
- create the following as data sources because, in this case, it is already available in your cloud infrastructure
  - vcn.tf
  - subnet.net
  - NOTE: The vcn data source is not needed as an attribute to the compute
- FINALLY, create your compute.tf 

