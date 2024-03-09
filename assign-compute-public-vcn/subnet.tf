data "oci_core_subnet" "pcap-lab-subnet" {
    #Required
    subnet_id = var.pcap_lab_subnet
}
