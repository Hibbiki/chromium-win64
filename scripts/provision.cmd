@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

gclient sync && xcopy /f /s /e /i ..\internal src\google_apis\internal