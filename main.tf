##############################################################################
# IBM Cloud Provider
# Provider details available at
# http://ibmcloudterraformdocs.chriskelner.com/docs/providers/ibmcloud/index.html
##############################################################################
# See the README for details on ways to supply these values
provider "ibmcloud" {
  ibmid                    = "${var.ibmid}"
  ibmid_password           = "${var.ibmidpw}"
  softlayer_account_number = "${var.slaccountnum}"
}

##############################################################################
# IBM Baremetal server
# http://ibmcloudterraformdocs.chriskelner.com/docs/providers/ibmcloud/r/infra_bare_metal.html
##############################################################################
resource "ibmcloud_infra_bare_metal" "baremetal-test" {
    hostname = "test"
    domain = "bar.test.com"
    os_reference_code = "UBUNTU_16_64"
    datacenter = "${var.datacenter}"
    network_speed = 100 # Optional
    hourly_billing = true # Optional
    private_network_only = false # Optional
    fixed_config_preset = "S1270_8GB_2X1TBSATA_NORAID"
}

##############################################################################
# Variables
##############################################################################
# Required for the IBM Cloud provider
variable ibmid {
  type = "string"
  description = "Your IBM-ID."
}
# Required for the IBM Cloud provider
variable ibmidpw {
  type = "string"
  description = "The password for your IBM-ID."
}
# Required to target the correct SL account
variable slaccountnum {
  type = "string"
  description = "Your Softlayer account number."
}
# The datacenter to deploy to
variable datacenter {
  default = "dal06"
}
