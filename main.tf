locals {
  ssh_authorized_keys=""
  compartment_id      = ""
  availability_domain = ""
  subnet_id = ""
  image_id   = ""

}


module "oci_compute_apache" {
  source = "./terraform-oci-apache-example"
  ad = local.availability_domain
  compartment_id = local.compartment_id
  subnet_id = local.subnet_id
  image_id = local.image_id
  pub_ssh_keys = local.ssh_authorized_keys

}

output "name" {
  value=module.oci_compute_apache.public_ip
}