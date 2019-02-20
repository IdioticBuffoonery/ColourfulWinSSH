function Get-Architecture {
    #Change this to "x86" if you are using a x86 based system!
    $global:architecture = "x64"
    confirmScript
}

function Get-PrintBright {
    Set-ExecutionPolicy Bypass -Scope Process
    Write-Host "Welcome to ColourfulWinSSH (via Putty)!" -foreground "Yellow"
    Write-Host "A way to connect to your SSH Terminal via Power Shell" -foreground "Yellow"
}

function Get-ExitMain {
    clear
    Write-Host "Do you wish to exit the whole session?" -foreground "Red"
    $choVar = Read-Host -Prompt ' y/N >'
        if ($choVar -eq "y"){
            exit
        } else {
            clear
            confirmScript
        }
}

function confirmScript{
    Get-PrintBright
    Write-Host "Please enter your Hostname (or IP address)`n"
    $choVar = Read-Host -Prompt ' >'
    if ($choVar -eq "exit"){
        Get-ExitMain
    }
	if ($choVar -eq ""){
        clear
        Write-Host "You must enter a Hostname (or IP address)!" -foreground "Red"
        confirmScript
    } else {
        clear
	    $cmd = "./bin/ansicon/$global:architecture/ansicon.exe plink -ssh $choVar"
	    Invoke-Expression $cmd
       }
}
$host.UI.RawUI.WindowTitle = "ColourfulWinSSH - PowerShell"
Get-Architecture