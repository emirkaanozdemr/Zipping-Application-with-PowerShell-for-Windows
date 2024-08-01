Write-Host "Names of folders:"
$folders = Read-Host | Out-String | ForEach-Object { $_.Trim() } | Split-String -Delimiter ' '

Write-Host "What will its name be?"
$zipName = Read-Host

if (Test-Path $zipName) {
    Remove-Item $zipName
}

foreach ($folder in $folders) {
    if (Test-Path $folder -and (Test-Path $folder -PathType Container)) {
        Compress-Archive -Path $folder -Update -DestinationPath $zipName
    } else {
        Write-Host "$folder didn't find."
    }
}

Write-Host "All directories zipped as $zipName."
