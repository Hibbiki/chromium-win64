@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd chromium\src
cmd /c "gn clean out\stable-windows-amd64"
cd ..\..