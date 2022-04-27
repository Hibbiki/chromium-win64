@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd src
FOR %%f IN (%CHROMIUM_DIR%\patch\*.patch) DO git am --reject --signoff < %%f
cd ..