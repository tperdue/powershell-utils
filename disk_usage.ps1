
. ./dot_env_funcs.ps1

Import-DotEnv

$rootPath = Get-DotEnv -Name "ROOT_PATH"

function Get-FolderSize{
    param(
        [string]$folder
    )
    $folderSize = 0
    Get-ChildItem -Path $folder -Recurse -Force  | ForEach-Object {
        $folderSize += $_.Length
    }

    return $folderSize
}


$folders = Get-ChildItem -Directory -Path $rootPath
$folderSizes = @()

foreach ($folder in $folders) {
    $size = Get-FolderSize -folder $folder.FullName

    $folderSizes += [PSCustomObject]@{
        FolderName = $folder.FullName
        SizeMB     = [math]::round($size / 1MB, 2)
    }
}

$folderSizes  | Export-Csv -Path "disk_usage.csv" -NoTypeInformation
