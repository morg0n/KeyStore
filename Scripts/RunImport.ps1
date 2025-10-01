Param(
    [Parameter(Mandatory = $true)]
    [String]$configPath,
    [Parameter(Mandatory = $true)]
    [String]$importFile
)

#.\import access.ps1 -configPath .\keyfile.json -importFile "Access_Profiles_ROLES_source.csv"

$configObject = Get-Content -Raw -path $configPath | ConvertFrom-Json
$configObject = Get-Content -Raw -path $importFile | ConvertFrom-Csv
$entitlementListMap = @{}

$entitlementsList = New-Object System.Collections.ArrayList 
$accessList = New Object System.Collections.ArrayList 

function Get-GovernanceGroups () {
    $groupResponse = Invoke-RestMethod -Method GET -Uri "$($configObject.v2URI)/beta/workgroups"
}
