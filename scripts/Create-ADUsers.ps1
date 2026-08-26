Import-Module ActiveDirectory

$csvFile = Read-Host "Enter the HR onboarding CSV filename"
$csvPath = Join-Path "C:\LabScripts" $csvFile

if (-not (Test-Path $csvPath)) {
    Write-Host "ERROR: File not found: $csvPath"
    exit
}

$users = Import-Csv $csvPath
$securePassword = Read-Host "Enter initial password for new users" -AsSecureString

foreach ($user in $users) {

    try {

        if (Get-ADUser -Filter "SamAccountName -eq '$($user.Username)'" -ErrorAction SilentlyContinue) {
            Write-Warning "Skipped $($user.Username): username already exists."
            continue
        }

        $manager = Get-ADUser -Identity $user.Manager -ErrorAction Stop

        New-ADUser `
            -Name "$($user.FirstName) $($user.LastName)" `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -SamAccountName $user.Username `
            -UserPrincipalName "$($user.Username)@ellistech.test" `
            -EmployeeID $user.EmployeeID `
            -Department $user.Department `
            -Title $user.JobTitle `
            -Office $user.Location `
            -Manager $manager.DistinguishedName `
            -Path $user.OU `
            -AccountPassword $securePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $false

        switch ($user.Department) {
            "Finance" { Add-ADGroupMember -Identity "GG_Finance" -Members $user.Username }
            "HR"      { Add-ADGroupMember -Identity "GG_HR" -Members $user.Username }
            "IT"      { Add-ADGroupMember -Identity "GG_IT" -Members $user.Username }
        }

        Write-Host "SUCCESS: Created $($user.Username) in $($user.Department)"
    }

    catch {
        Write-Host "FAILED: $($user.Username) - $($_.Exception.Message)"
    }
}