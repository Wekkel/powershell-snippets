 function Start-Chrome([string]$arg1) { Start-Process "chrome.exe" $arg1 }
 Set-Alias oc Start-Chrome