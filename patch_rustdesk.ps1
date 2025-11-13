# Patch RustDesk config (server, api, key)

$server = "koo2355.synology.me"
$key = "2Nplw2eqfhdJxP1P+f0TD3SJMRCpLGA4FAUbnawO5e8="

$configFile = ".\src\common\config.rs"

# Replace Rendezvous Server
(Get-Content $configFile) |
ForEach-Object {
    $_ -replace 'DEFAULT_RENDEZVOUS_SERVER: &str = ".*?"', "DEFAULT_RENDEZVOUS_SERVER: &str = `"$server:21116`""
} | Set-Content $configFile

# Replace API Server
(Get-Content $configFile) |
ForEach-Object {
    $_ -replace 'DEFAULT_API_SERVER: &str = ".*?"', "DEFAULT_API_SERVER: &str = `"$server`""
} | Set-Content $configFile

# Replace Public Key
(Get-Content $configFile) |
ForEach-Object {
    $_ -replace 'DEFAULT_PUBLIC_KEY: &str = ".*?"', "DEFAULT_PUBLIC_KEY: &str = `"$key`""
} | Set-Content $configFile

Write-Output "PATCH_OK"

