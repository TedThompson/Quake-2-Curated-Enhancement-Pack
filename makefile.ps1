if (Test-Path release) {
	Read-Host -prompt "ERROR: Directory Exists, delete 'release' folder and try again.`n`nPress ENTER to close this window."
	exit
}
mkdir release
Copy-Item src\* release
mkdir release\baseq2\players
Copy-Item src\music\*.* release\music
Copy-Item src\Gladiator\* release\Gladiator -Recurse
Copy-Item src\baseq2\players\* release\baseq2\players -Recurse
Copy-Item src\baseq2\*.txt release\baseq2
Compress-Archive src\baseq2\env release\baseq2\pak-env.zip
Compress-Archive src\baseq2\models release\baseq2\pak-models.zip
Compress-Archive src\baseq2\textures release\baseq2\pak-textures.zip
Compress-Archive src\baseq2\pics release\baseq2\pak-kmq2_HUD_REpak.zip
Compress-Archive src\baseq2\kmq2_HUD_REpak_README.txt -update release\baseq2\pak-kmq2_HUD_REpak.zip
Compress-Archive src\baseq2\mypics\pics release\baseq2\pak-HUD_Supplemental.zip
Compress-Archive src\baseq2\HUD_Supplemental_README.txt -update release\baseq2\pak-HUD_Supplemental.zip
cd release\baseq2
Get-ChildItem *.zip | Rename-Item -NewName { $_.Name -replace '.zip','.pk3' }
Read-Host -prompt "Package assembled and placed in 'release' folder.`n`nPress ENTER to close this window."