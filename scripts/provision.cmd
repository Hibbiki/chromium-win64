@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd chromium
gclient sync && xcopy /f /s /e /i %CHROMIUM_DIR%\internal src\google_apis\internal
cd ..