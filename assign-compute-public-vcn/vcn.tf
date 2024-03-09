data "oci_core_vcns" "pcap-lab-vcn" {
    #Required
    compartment_id = var.pcap_ocid

    #Optional
    display_name = var.vcn_display_name
}
