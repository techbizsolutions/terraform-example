resource "azurerm_key_vault" "main" {
  name                = "${var.azurename_prefix}-keyvault"
  location            = "${var.region}"
  resource_group_name = "${var.resource_group_name}"

  sku {
    name = "${var.serverinfo["storage_sku"]}"
  }

  tenant_id = "${var.tenant_id}"

  enabled_for_disk_encryption = "${var.serverinfo["disk_encryption_enabled"]}"

  tags {
     role         = "${var.serverinfo["role"]}"
     client       = "${var.tags["client"]}"
     environment  = "${var.environment}"
     costcenter   = "${var.tags["costcenter"]}"
  }
}
