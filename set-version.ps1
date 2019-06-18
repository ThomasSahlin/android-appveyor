Write-Host "APPVEYOR_REPO_BRANCH: $($env:APPVEYOR_REPO_BRANCH)"
Write-Host "APPVEYOR_REPO_TAG: $($env:APPVEYOR_REPO_TAG)"
Write-Host "APPVEYOR_REPO_TAG_NAME: $($env:APPVEYOR_REPO_TAG_NAME)"

git log --tags --date-order --pretty="format:%d"

$tags = git log --tags --date-order --pretty="format:%d" | Select-String -Pattern 'tag: v([0-9]+\.[0-9]+\.[0-9]+)'

if ($tags.Matches.Length -eq 0)
{
    Write-Host "No version tags found"
    Exit
}

$version = "$($tags.Matches[0].Groups[1])"

Write-Host "Found version: $version"

$version = "$version.$($env:APPVEYOR_BUILD_NUMBER)"

Write-Host "Setting version: $version"

Update-AppveyorBuild -Version $version
