@echo off

set CHROMIUM_DIR=X:

set PATH=%CHROMIUM_DIR%\depot_tools;%CHROMIUM_DIR%\scripts;%PATH%
set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set IN_CHROMIUM_BUILDER=1

cmd /c "git config --global core.autocrlf false"
cmd /c "git config --global core.filemode false"
cmd /c "git config --global branch.autosetuprebase always"

cmd /k cd %CHROMIUM_DIR%\depot_tools