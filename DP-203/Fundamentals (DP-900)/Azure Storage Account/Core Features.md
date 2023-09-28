```bash
resource "azurerm_resource_group" "az-203-rg" {
  name     = "az-203-rg"
  location = "East US"
}

resource "azurerm_storage_account" "az-203-sa" {
  name                     = "az-203-sa"
  resource_group_name      = azurerm_resource_group.az-203-rg.name
  location                 = azurerm_resource_group.az-203-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

  

resource "azurerm_storage_container" "az-203-bc" {
  name                  = "az-203-bc"
  storage_account_name  = azurerm_storage_account.az-203-sa.name
  container_access_type = "blob"
}

  

resource "azurerm_role_assignment" "anonymous_blob_access" {
  principal_id         = "00000000-0000-0000-0000-000000000000"
  role_definition_name = "Reader"
  scope                = azurerm_storage_container.az-203-bc.id
}
```
## Performance Tier

- **Standard** - performance tier for storing blobs, files, tables, queues, and Azure virtual machine disks
- **Premium** - Performance tier for storing unmanaged virtual machine disks only
## Data Redundancy

**Azure Storage replicates multiple copies of your data**

Replication options for a storage account include:
- Locally-redundant storage (LRS)
- Zone-redundant storage (ZRS)
- Geo-redundant storage (GRS)
- Read-access geo-redundant storage (RA-GRS)

### Locally-redundant storage 
![[Pasted image 20230921201112.png]]

### Zone-redundant storage
![[Pasted image 20230921201150.png]]

### Geo-redundant storage
![[Pasted image 20230921201216.png]]

### Read-access geo-redundant storage
![[Pasted image 20230921201441.png]]

## Storage APIs and Libraries

- **REST API**
- **Client Library**
	-  .NET
	-  Java/Android
	-  Node.js
	-  Python
	-  PHP
	-  Ruby
	-  C++

