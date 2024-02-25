output availability-domain {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

output my-vcn {
  value = module.vcn.vcn_id
}

output private-subnet {
  value = resource.oci_core_subnet.vcn-private-subnet.id
}
