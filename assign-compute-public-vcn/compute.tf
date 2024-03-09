resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name

    compartment_id = var.pcap_ocid
    # oci compute image-shape-compatibility-entry list ---image-id <source_id> 
    shape = "<select the compatible shape>"
    
    # Required
    shape_config {
       ocpus = <number-of-ocpus>
    }
   
    # Required
    source_details {
	source_id = var.source_id
        source_type = "image"
    }

    display_name = <name-of-instance>
    create_vnic_details {
        assign_public_ip = true
        # assigning the available subnet
        subnet_id = var.pcap_lab_subnet
    }

    metadata = {
        ssh_authorized_keys = file("<file-path-to-pub-key>")
    } 

}
