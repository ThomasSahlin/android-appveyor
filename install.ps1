$dir = "C:\Microsoft\AndroidNDK64\android-ndk-r15c"
$url = "https://dl.google.com/android/repository/android-ndk-r15c-windows-x86_64.zip"

if (Test-Path $dir)
{
    Exit
}

New-Item -ItemType Directory -Path $dir

$tmpFile = "C:\Microsoft\AndroidNDK64\ndk.zip"

(New-Object System.Net.WebClient).DownloadFile($url, $tmpFile)

7z x $tmpFile

Remove-Item $tmpFile
