$containerName = (Split-Path -Path $PSScriptRoot -Leaf)

$credential = New-Object PSCredential 'admin', (ConvertTo-SecureString -String '1234' -AsPlainText -Force)

New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -artifactUrl (Get-BCArtifactUrl -type Sandbox -version 20.0.37253.39558) `
    -auth NavUserPassword `
    -Credential $credential `
    -updateHosts `
    -isolation hyperv