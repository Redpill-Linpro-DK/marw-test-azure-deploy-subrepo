param applicationName string
param location string
param env string
param postfixCount string
param tags object
param uniqueDeployId string

var storageAccountName = toLower('st${applicationName}${env}${uniqueDeployId}${postfixCount}')
var storageAccountSku = 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: 'StorageV2'
  tags: tags
}

output storageAccountId string = storageAccount.id
