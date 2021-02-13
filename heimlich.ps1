# HEIMLICH - Up-chuck your your Valheim world into a safe repository
# By Connor McNamara - 2/12/2021

# Best used in conjunction with Task Scheduler for automated backups
# https://blog.netwrix.com/2018/07/03/how-to-automate-powershell-scripts-with-task-scheduler/ 

###########################################

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
