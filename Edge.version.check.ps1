$requiredVersion = '114.0.1823.43'
$LASTEXITCODE = '1337'

# Split the required version into an array of integers
$req = $requiredVersion.Split('.') | ForEach-Object { [int]$_ }

# Retrieve the installed version of msedge.exe
$installedVersion = (Get-Item "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe").VersionInfo.ProductVersion

# Split the installed version into an array of integers
$inst = $installedVersion.Split('.') | ForEach-Object { [int]$_ }

$greater = $true

# Compare the versions
if ($installedVersion -ne $requiredVersion) {
    $greater = $false
    for ($i = 0; $i -lt $req.Count; $i++) {
        if ($req[$i] -lt $inst[$i]) {
            $greater = $true
            break
        }
        if ($req[$i] -gt $inst[$i]) {
            $greater = $false
            break
        }
    }
}

Write-Host $installedVersion

# Update the exit code based on the comparison result
if ($greater) {
    $LASTEXITCODE = '0'
}

Exit $LASTEXITCODE
