Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

. "$PSScriptRoot\functions.ps1"
. "$PSScriptRoot\..\config.ps1"

$repoRoot = Resolve-Path "$PSScriptRoot/../.."
$devMission = "kp_liberation.$devMap"

<#
    .DESCRIPTION
    Create development mission files with framework inside specified profile directory.
#>
function Add-MissionFiles($profileDir) {
    $targetDir = "$($profileDir.FullName)/mpmissions"
    # ensure that $targetDir directory exists
    New-Item -ItemType Directory -Path $targetDir -ErrorAction SilentlyContinue | Out-Null

    # Link Missionframework into editor mission directory
    (gi "$targetDir/$devMission").Delete()
    New-Item -ItemType Junction -Path "$targetDir/$devMission" -Value "$repoRoot/Missionframework" -Force

    $baseMission = Get-Item "$repoRoot/Missionbasefiles/$devMission"
    New-Item -ItemType HardLink  -Path "$repoRoot/Missionframework/mission.sqm" -Value "$baseMission/mission.sqm" -Force
}

$targetProfileDir = Get-TargetProfileDir
Add-MissionFiles $targetProfileDir

