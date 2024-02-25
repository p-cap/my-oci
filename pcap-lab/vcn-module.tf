module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"

  # pcap-compartment is a required input
  compartment_id = var.pcap_tenancy

  vcn_name = "blue-space"
}
