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
cd src\baseq2
#
# Stupid fucking Compress-Archive isn't 100% accurate zip builder it seems...
# At least not for Yagami to open and read it.
# Had to flip to using good ol' WinRAR to make a legit ZIP. 
# Micro$hit strikes again.
#
#Compress-Archive src\baseq2\env release\baseq2\pak-env.zip
winrar a ..\..\release\baseq2\pak-env.zip env | Out-Null
#Compress-Archive src\baseq2\models release\baseq2\pak-models.zip
winrar a ..\..\release\baseq2\pak-models.zip models | Out-Null
#Compress-Archive src\baseq2\textures release\baseq2\pak-textures.zip
winrar a ..\..\release\baseq2\pak-textures.zip textures | Out-Null
#Compress-Archive src\baseq2\pics release\baseq2\pak-kmq2_HUD_REpak.zip
winrar a ..\..\release\baseq2\pak-kmq2_HUD_REpak.zip pics | Out-Null
#Compress-Archive src\baseq2\mypics\pics release\baseq2\pak-HUD_Supplemental.zip
cd mypics
winrar a ..\..\..\release\baseq2\pak-HUD_Supplemental.zip pics | Out-Null

cd ..\..\..\release\baseq2
Get-ChildItem *.zip | Rename-Item -NewName { $_.Name -replace '.zip','.pk3' }
Read-Host -prompt "Package assembled and placed in 'release' folder.`n`nPress ENTER to close this window."