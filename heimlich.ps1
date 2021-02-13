# Replace this string with the location of your root Valheim folder (you likely just need to change the username)
$path = "C:\Users\Connor\AppData\LocalLow\IronGate\Valheim"
# This sets the backup location
$backupLocation = "C:\users\public\documents\ValheimBackups"

if ((Test-Path -Path $backupLocation) -eq $false)
{
    mkdir $backupLocation    
}

$today = Get-Date
$dateString = $today.Year.ToString() + "_" + $today.Month.ToString() + "_" + $today.Day.ToString()

Compress-Archive -Path "$path\worlds" -DestinationPath "$backupLocation\$dateString"
