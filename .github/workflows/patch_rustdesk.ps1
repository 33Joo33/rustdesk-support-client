# ==========================
# RustDesk 자동 서버 패치 스크립트
# ==========================

$server = "koo2355.synology.me"
$key = "2Nplw2eqfhdJxP1P+f0TD3SJMRCpLGA4FAUbnawO5e8="

$configFile = ".\src\common\config.rs"

(Get-Content $configFile) |
ForEach-Object {
    $_ -replace 'DEFAULT_RENDEZVOUS_SERVER: &str = ".*?"', "DEFAULT_RENDEZVOUS_SERVER: &str = `"$server:21116`""
} | Set-Content $configFile

(Get-Content $configFile) |
ForEach-Object {
    $_ -replace 'DEFAULT_API_SERVER: &str = ".*?"', "DEFAULT_API_SERVER: &str = `"$server`""
} | Set-Content $configFile

(Get-Content $configFile) |
ForEach-Object {
    $_ -replace 'DEFAULT_PUBLIC_KEY: &str = ".*?"', "DEFAULT_PUBLIC_KEY: &str = `"$key`""
} | Set-Content $configFile

Write-Host "패치 완료!"
