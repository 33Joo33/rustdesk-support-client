Write-Host "RustDesk 서버 설정 적용 중..."

$server = "koo2355.synology.me"
$relay  = "koo2355.synology.me:21117"
$pubKey = "2Nplw2eqfhdJxP1P+f0TD3SJMRCpLGA4FAUbnawO5e8="

$files = Get-ChildItem -Recurse -Filter "*.rs"

foreach ($file in $files) {
    (Get-Content $file.FullName) |
      ForEach-Object {
        $_ -replace "DEFAULT_ID_SERVER.*", "const DEFAULT_ID_SERVER: &str = `"$server`";" `
           -replace "DEFAULT_RELAY_SERVER.*", "const DEFAULT_RELAY_SERVER: &str = `"$relay`";" `
           -replace "DEFAULT_PUBLIC_KEY.*", "const DEFAULT_PUBLIC_KEY: &str = `"$pubKey`";"
      } | Set-Content $file.FullName
}

Write-Host "패치 완료!"
