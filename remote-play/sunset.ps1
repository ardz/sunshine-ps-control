$sunshineservice = Get-Service | Where-Object {$_.Name -eq "SunshineService"}

if ($sunshineservice.Status -eq "Running"){
    
    $sunshineservice | Stop-Service
    Sleep 3
}