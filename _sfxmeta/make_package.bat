:: Source config
call conf.bat

:: Make an archive of the parent dir (exclude ResourceHacker.exe)
7z a -mx=%COMPRESSION_LEVEL% archive.7z .. -x!_sfxmeta\ResourceHacker.exe

:: Create a self-extracting archive config file
echo ;!@Install@!UTF-8! > 7zsfx.conf
echo RunProgram="%EXE_PATH%" >> 7zsfx.conf
echo ;!@InstallEnd@! >> 7zsfx.conf

:: Make the self-extracting archive
copy /b 7zSD.sfx + 7zsfx.conf + archive.7z sfx.exe

:: Use ResourceHacker to tweak the exe
:: Extract icon and version info from the target exe
ResourceHacker.exe -open "../%EXE_PATH%" -save icon.ico -action extract -mask ICONGROUP,%ICON_NAME%, -log CON
ResourceHacker.exe -open "../%EXE_PATH%" -save version.res -action extract -mask VERSIONINFO,, -log CON

:: Create a ResourceHacker script that will add the data to the new exe
echo [FILENAMES] > rh.script
echo Open=sfx.exe >> rh.script
echo Save=output.exe >> rh.script
echo Log=CONSOLE >> rh.script
echo [COMMANDS] >> rh.script
:: Set the icon
echo -addoverwrite icon.ico, ICONGROUP,1, >> rh.script
:: Add a manifest that states it doesn't need admin permissions
echo -addoverwrite manifest.xml, MANIFEST,1, >> rh.script
:: Set the version info
echo -addoverwrite version.res, VERSIONINFO,1, >> rh.script

:: Run the script
ResourceHacker.exe -script rh.script

:: Clean up
del 7zsfx.conf
del archive.7z
del version.res
del icon.ico
del ResourceHacker.ini
del rh.script
del sfx.exe

:: Pause so the output can be seen
@pause