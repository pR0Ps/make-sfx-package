:: Compression level to use (0=none, 9=max)
:: Smaller values produce bigger files but extract faster
set COMPRESSION_LEVEL=5

:: The path to the executable to run after extraction
:: (relative to the parent directory)
set EXE_PATH=

:: The name of the icon in the above executable to use for the packaged
:: executable.
:: Can be found by opening the exe with ResourceHacker.exe and looking in the
:: "Icon Group" section.
set ICON_NAME=MAINICON