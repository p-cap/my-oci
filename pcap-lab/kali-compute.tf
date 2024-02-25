resource "oci_core_instance" "kali-linux" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = var.pcap_tenancy
    shape = "VM.Standard2.1"
    source_details {
        source_id = #TODO
        source_type = "image"
    }

    # Optional
    display_name = #TODO
    create_vnic_details {
        assign_public_ip = true
        subnet_id = #TODO
    }
    metadata = {
        ssh_authorized_keys = file("") #TODO
    } 
    preserve_boot_volume = false
}
