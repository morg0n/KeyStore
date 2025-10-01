Param(
    [Parameter(Mandatory = $true)]
    [String]$configPath,
    [Parameter(Mandatory = $true)]
    [Array]$sourceNameList,
    [Parameter()]
    [Switch]$unusedOnly
)

$configObject = Get-Content -Raw -Path $configPath | ConvertFrom-Json

function Get-Sources () {
#   write-host -foregroundcolor yellow "$($configObject.v2URI)/beta/sources?filters=name eq ""$($sourceName)"""
$sourceResponse = Invoke-RestMethod - Method GET -Uri "$($configObject.v2URI)/beta/sources"
return $sourceResponse
}

function Get-Access ($sourceId)