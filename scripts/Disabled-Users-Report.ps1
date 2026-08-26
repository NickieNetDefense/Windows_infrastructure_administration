Import-Module ActiveDirectory

$outputFile = Read-Host "Enter output CSV filename"
$outputPath = Join-Path "C:\LabScripts" $outputFile

Get-ADUser -Filter {Enabled -eq $false} -Properties Department,Title,LastLogonDate |
    Select-Object `
        SamAccountName,
        DisplayName,
        Department,
        Title,
        Enabled,
        LastLogonDate,
        DistinguishedName |
    Export-Csv $outputPath -NoTypeInformation

Write-Host "SUCCESS: Disabled user report exported to $outputPath"