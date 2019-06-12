$ndkDir = "C:\Microsoft\AndroidNDK64\android-ndk-r15c"

if (!(Test-Path $ndkDir))
{
    New-Item -ItemType Directory -Path $ndkDir
}

