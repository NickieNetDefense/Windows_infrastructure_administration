Import-Module ActiveDirectory

$outputFile = Read-Host "Enter output CSV filename"
$outputPath = Join-Path "C:\LabScripts" $outputFile

Get-ADComputer -Filter * -Properties OperatingSystem,OperatingSystemVersion,Enabled,LastLogonDate |
    Select-Object `
        Name,
        OperatingSystem,
        OperatingSystemVersion,
        Enabled,
        LastLogonDate,
        DistinguishedName |
    Export-Csv $outputPath -NoTypeInformation

Write-Host "SUCCESS: AD computer inventory exported to $outputPath"