variable "tenancy_ocid" {
  type = string
  description = "this is the pcap-compartment"
}

variable "user_ocid" {
  type = string
  description = "pcap user ocid"
}

variable "private_key_path" {
  type = string
  description = "path to private key"
}

variable "fingerprint" {
  type = string
  description = "API fingerprint"
}

variable "region" {
  type = string
  description = "region"
}

variable "pcap_ocid" {
  type = string
  description = "region"
}

variable "vcn_display_name" {
  type = string
  description = "vcn display name"
}

variable "pcap_lab_subnet" {
  type = string
  description = "pcap lab subnet"
}

# oci compute image list -c <compartment-id>
variable "source_id" {
  type = string
  description = "source id of image based on region"
}
