Get-ChildItem -Path . -Recurse -Filter *.xml | ForEach-Object {
    & .\WinSW-x64.exe install $_.FullName
    & .\WinSW-x64.exe start $_.FullName
}