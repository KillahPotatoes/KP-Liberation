Set-StrictMode -Version latest
$ErrorActionPreference = "Stop"

. "$PSScriptRoot\functions.ps1"
. "$PSScriptRoot\..\config.ps1"

$devMission = "kp_liberation.$devMap"

function Get-Arma3LaunchCommand {
    param (
        [Parameter(Mandatory)]
        [string]    $exePath,
        [array]     $modsArray = @("vn")
    )

    $baseParams = '-world=empty -window -noPause -noSplash -skipIntro'
    $params = @(
        "-name=""$armaProfile"""
    ) -join ' '

    $command = @(
        """$exePath"""
        $params,
        "-mod=""$($modsArray -join ';')""",
        $baseParams,
        """$(Get-TargetProfileDir)\mpmissions\$devMission"""
    )

    return $command
}

$launchCommand = Get-Arma3LaunchCommand -ExePath "$armaDir/$armaExe" -ModsArray $modsArray
Write-Host $launchCommand

Start-Process $launchCommand[0] ($launchCommand | Select-Object -Skip 1)
