locals {
    shape = "BM.Standard2.52"
    display_name = "Test_OL7_OCI_Compute"

}

resource "oci_core_instance" "test_instance" {
  availability_domain = var.ad
  compartment_id      = var.compartment_id
  shape        = local.shape
  display_name = local.display_name

  create_vnic_details {
    subnet_id = var.subnet_id
    assign_public_ip = true

  }
  source_details {
    source_id   = var.image_id
    source_type = "image"
  }
  metadata = {
    ssh_authorized_keys=var.pub_ssh_keys
    user_data = base64encode(file("${path.module}/cloud-init.yaml"))
  }
}