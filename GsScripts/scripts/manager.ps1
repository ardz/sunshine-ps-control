function Show-Menu
{
    Clear-Host

    $wow = @"
                        |
                    .   |
                        |
          \    *        |     *    .  /
            \        *  |  .        /
         .    \     ___---___     /    .  
                \.--         --./     
     ~-_    *  ./               \.   *   _-~
        ~-_   /                   \   _-~     *
   *       ~-/                     \-~        
     .      |                       |      .
         * |                         | *     
-----------|                         |-----------
  .        |                         |        .    
        *   |                       | *
           _-\                     /-_    *
     .  _-~ . \                   /   ~-_     
     _-~       `\               /'*      ~-_  
    ~           /`--___   ___--'\           ~
           *  /        ---     .  \   Go f**k yourselves Nvidia.
            /     *     |           \
          /             |   *         \
                     .  |        .
                        |
                        |
"@

    Write-Host $wow
    Write-Host
    Write-Host "--- Sunshine Gamestream Server and VirtualHere Client Admin ---"
    Write-Host
    Write-Host "1: Press '1' to start Sunshine server and VirtualHere client."
    Write-Host "2: Press '2' to stop Sunshine server and VirtualHere client."
	Write-Host "3: Press '3' to open Sunshine Admin UI and VirtualHere client UI."
    Write-Host "Q: Press 'q' to quit."
}

function Run-AsAdmin
{
	    param (
        [string]$ScriptPath
    )
	
	$path = Join-Path $PSScriptRoot $ScriptPath
	
	Start-Process powershell -verb runas -ArgumentList "-file $path"
}

function Show-Service
{
	Write-Host
    Write-Host "[getting Sunshine and VirtualHere service statuses, please wait...]"
    Start-Sleep -Seconds 3
    Write-Host
    Get-Service "sunshinesvc"
	Get-Service "vhclient"
}

do
 {
     Show-Menu
     Write-Host
     Show-Service
     Write-Host
     $selection = Read-Host "Choose an option"
     switch ($selection)
     {
         '1' {
			 Write-Host "Starting Sunshine server..."
			 Run-AsAdmin -ScriptPath 'sunrise.ps1'
			 Run-AsAdmin -ScriptPath 'startvh.ps1'
         } 
         
         '2' {
			 Write-Host "Stopping Sunshine server..."
			 Run-AsAdmin -ScriptPath 'sunset.ps1'
			 Run-AsAdmin -ScriptPath 'stopvh.ps1'
         }
		 
		 '3' {
			 Write-Host "Opening https://localhost:47990/"
			 Start-Process "https://localhost:47990/"
			 Start-Process "E:\Program Files\vhui64.exe"
         }
     }
 }
 until ($selection -eq 'q')