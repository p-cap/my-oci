output availability-domain {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

output pcap-lab-vcn {
  value = data.oci_core_vcns.pcap-lab-vcn.display_name
}

output pcap-lab-subnet {
  value = data.oci_core_subnet.pcap-lab-subnet.display_name
}
