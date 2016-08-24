#Requires -Version 2.0
$ErrorActionPreference = 'Stop'

$url = 'http://www.f2ko.de/downloads/cmdtools/sendkey.exe'
$reference_hash = '79f0d26a0da573794dc4cfc31215678fb67e69cc'

$sendkey_binary = Join-Path (Get-Location) 'sendkey.exe'
(New-Object System.Net.WebClient).DownloadFile($url, $sendkey_binary)
$algo = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
$hash = $algo.ComputeHash([System.IO.File]::ReadAllBytes($sendkey_binary))
$hash_string = [System.BitConverter]::ToString($hash).Replace('-', '').ToLower()
if ($hash_string -ne $reference_hash) {
    Remove-Item $sendkey_binary
    Write-Error -Message ("Wrong checksum for $sendkey_binary. " +
                          "The file may be corrupted or the wrong version.")
}
