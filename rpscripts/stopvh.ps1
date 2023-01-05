$vhclient = Get-Process | Where-Object {$_.ProcessName -eq "vhui64"} -ErrorAction SilentlyContinue

if ($vhclient){
    
    $vhclient | Stop-Process
    Sleep 3
}

if (!$vhclient.HasExited){

    $vhclient | Stop-Process -Force
}

$vhclientservice = Get-Service | Where-Object {$_.Name -eq "vhclient"}

if ($vhclientservice.Status -eq "Running"){
    
    $vhclientservice | Stop-Service
    Sleep 3
}