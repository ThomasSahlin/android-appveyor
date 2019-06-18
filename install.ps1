$baseDir = "C:\Microsoft\AndroidNDK64"
$ndkDir = "android-ndk-r15c"
$url = "https://dl.google.com/android/repository/android-ndk-r15c-windows-x86_64.zip"

if (Test-Path "$baseDir\$ndkDir")
{
    Write-Host "Android NDK directory found: $baseDir\$ndkDir"
    Exit
}

New-Item -ItemType Directory -Path $baseDir

$tmpFile = "$baseDir\ndk.zip"

Write-Host "Downloading Android NDK 15c from:`n$url"
(New-Object System.Net.WebClient).DownloadFile($url, $tmpFile)

Write-Host "Unzipping NDK"
7z x $tmpFile "-o$baseDir"

Remove-Item $tmpFile
