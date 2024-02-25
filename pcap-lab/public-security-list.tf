# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "public-security-list"{

# Required
  compartment_id = var.pcap_tenancy
  vcn_id = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-public-subnet"


  egress_security_rules {
    stateless = false
    destination = #TODO
    destination_type = "CIDR_BLOCK"
    protocol = "all"
  }

  ingress_security_rules {
        stateless = false
        source = #TODO
        source_type = "CIDR_BLOCK"
        # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
        protocol = "6"
        tcp_options {
            min = 22
            max = 22
        }
      }

  ingress_security_rules {
      stateless = false
      source = #TODO
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1
      protocol = "1"

      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 3
        code = 4
      }
    }

  ingress_security_rules {
      stateless = false
      source =#TODO
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1
      protocol = "1"

      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 3
      }
    }
}
