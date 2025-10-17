targetScope = 'resourceGroup'

param stgName string = 'st0biceptest'
param location string = resourceGroup().location
param stgSku string = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: stgName
  location: location
  sku: {
    name: stgSku
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
}

output storageAccountId string = storageAccount.id
