#Install azcopy
 
#Curl.exe option (Windows 10 Spring 2018 Update (or later))
curl.exe -L -o AzCopy.zip https://aka.ms/downloadazcopy-v10-windows
 
#Expand Archive
Expand-Archive ./AzCopy.zip ./AzCopy -Force
 
#Move AzCopy to the destination you want to store it
Get-ChildItem ./AzCopy/*/azcopy.exe | Move-Item -Destination "$HOME\AzCopy\AzCopy.exe"
 
#Add your AzCopy path to the Windows environment PATH ($HOME\AzCopy in this example), e.g., using PowerShell:
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";$HOME\AzCopy", "User")