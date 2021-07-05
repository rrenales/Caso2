resource "azurerm_virtual_network" "myNet" {
    name                = "kubernetesnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    tags = {
        environment = "PRO"
    }
}

# Creación de subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet

resource "azurerm_subnet" "mySubnet" {
    name                   = "terraformsubnet"
    resource_group_name    = azurerm_resource_group.rg.name
    virtual_network_name   = azurerm_virtual_network.myNet.name
    address_prefixes       = ["10.0.1.0/24"]

}

# Create NIC
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface

resource "azurerm_network_interface" "myNic1" {
  name                = "vmnic1"  
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration1"
    subnet_id                      = azurerm_subnet.mySubnet.id 
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.10"
    public_ip_address_id           = azurerm_public_ip.myPublicIp1.id
  }

    tags = {
        environment = "PRO"
    }

}

resource "azurerm_network_interface" "myNic2" {
  name                = "vmnic2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration2"
    subnet_id                      = azurerm_subnet.mySubnet.id
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.11"
    public_ip_address_id           = azurerm_public_ip.myPublicIp2.id
  }

    tags = {
        environment = "PRO"
    }

}

resource "azurerm_network_interface" "myNic3" {
  name                = "vmnic3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

    ip_configuration {
    name                           = "myipconfiguration3"
    subnet_id                      = azurerm_subnet.mySubnet.id
    private_ip_address_allocation  = "Static"
    private_ip_address             = "10.0.1.12"
    public_ip_address_id           = azurerm_public_ip.myPublicIp3.id
  }

    tags = {
        environment = "PRO"
    }

}

# IP pública
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip

resource "azurerm_public_ip" "myPublicIp1" {
  name                = "vmip1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

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


resource "azurerm_public_ip" "myPublicIp2" {
  name                = "vmip2"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "PRO"
    }

}

resource "azurerm_public_ip" "myPublicIp3" {
  name                = "vmip3"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

    tags = {
        environment = "PRO"
    }

}
