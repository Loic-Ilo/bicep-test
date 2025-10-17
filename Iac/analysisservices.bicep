targetScope = 'resourceGroup'

param aasName string = 'asbiceptest'

param location string = resourceGroup().location

param asAdmins array = [
  'loic_ilo-digital.com#EXT#@loicilodigital.onmicrosoft.com'
]

resource analysisServices 'Microsoft.AnalysisServices/servers@2017-08-01' = {
  name: aasName
  location: location
  sku: {
    name: 'D1'
    tier: 'Development'
    capacity: 1
  }
  properties: {
    asAdministrators: {
      members: asAdmins
    }
    backupBlobContainerUri: ''
    querypoolConnectionMode: 'All'
  }
}

output aasServerName string = analysisServices.name
output serverLocation string = analysisServices.location
