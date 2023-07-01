#PowerShell

param(
    [Parameter(Mandatory=$true)]
    [string]$ZipFile
)

Add-Type -AssemblyName System.IO.Compression.FileSystem

# Remove the ".zip" extension from the input file name
$projectFolderName = $ZipFile -replace '\.zip$'

# Get the absolute path of the .zip file
$zipPath = Convert-Path $ZipFile

# Unzip the .zip file
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $pwd)

# Execute the command
$command = "idea $projectFolderName"
Invoke-Expression -Command $command
