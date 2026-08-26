Import-Module ActiveDirectory

$outputFile = Read-Host "Enter output CSV filename"
$outputPath = Join-Path "C:\LabScripts" $outputFile

Get-ADUser -Filter * -Properties Department,Title,EmployeeID,Enabled,Manager |
    Select-Object `
        SamAccountName,
        DisplayName,
        EmployeeID,
        Department,
        Title,
        Enabled,
        DistinguishedName |
    Export-Csv $outputPath -NoTypeInformation

Write-Host "SUCCESS: AD user report exported to $outputPath"