Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

$documents = "$env:UserProfile\Documents"

function Get-TargetProfileDir() {
    # $armaDefaultProfile = "$documents\Arma 3"
    $armaProfilesDir = "$documents\Arma 3 - Other Profiles"
    $profilePath = "$armaProfilesDir\$armaProfile"

    # ensure that $armaProfilesDir directory exists
    New-Item -ItemType Directory -Path $profilePath -ErrorAction SilentlyContinue | Out-Null

    return Get-Item $profilePath
}
