Get-ChildItem -Path . -Recurse -Filter *.xml | ForEach-Object {
    & .\WinSW-x64.exe stop $_.FullName
    & .\WinSW-x64.exe uninstall $_.FullName
}