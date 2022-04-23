Get-ChildItem -Recurse -Depth 2 -Force | 
    Where-Object { 
        $_.Mode -match "h" -and $_.FullName -like "*\.git" 
    } |
    ForEach-Object {
        Write-Host "📁 Updating repository $_"
        Set-Location $_.FullName
        Set-Location ../
        git pull
    }