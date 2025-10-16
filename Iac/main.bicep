// az deployment sub create --subscription "Azure subscription ilo-digital"  --location westeurope --template-file ./IaC/main.bicep
targetScope = 'subscription'

param rgName string = 'rg-bicep-test'
param location string = 'westeurope'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
    name: rgName
    location: location
}

output resourceGroupId string = rg.id
