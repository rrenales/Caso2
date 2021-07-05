resource "azurerm_linux_virtual_machine" "master" {
    name                = "master.ruben.cat"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.myNic1.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.ssh_user
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "PRO"
    }

}

# Save Public IP into data for output
data "azurerm_public_ip" "myPublicIp1" {
 name = azurerm_public_ip.myPublicIp1.name
 resource_group_name = azurerm_resource_group.rg.name
 depends_on = [azurerm_linux_virtual_machine.master]
}

output "master_public_address" {
  value = data.azurerm_public_ip.myPublicIp1.ip_address
}


}

resource "azurerm_linux_virtual_machine" "worker01" {
    name                = "worker01.ruben.cat"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.myNic2.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.ssh_user
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "PRO"
    }

}

# Save Public IP into data for output
data "azurerm_public_ip" "myPublicIp2" {
 name = azurerm_public_ip.myPublicIp2.name
 resource_group_name = azurerm_resource_group.rg.name
 depends_on = [azurerm_linux_virtual_machine.worker01]
}

output "master_public_address_1" {
  value = data.azurerm_public_ip.myPublicIp2.ip_address
}


resource "azurerm_linux_virtual_machine" "worker02" {
    name                = "worker02.ruben.cat"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.myNic3.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.ssh_user
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "PRO"
    }

}
# Save Public IP into data for output
data "azurerm_public_ip" "myPublicIp3" {
 name = azurerm_public_ip.myPublicIp3.name
 resource_group_name = azurerm_resource_group.rg.name
 depends_on = [azurerm_linux_virtual_machine.worker02]
}

output "master_public_address" {
  value = data.azurerm_public_ip.myPublicIp3.ip_address
}
