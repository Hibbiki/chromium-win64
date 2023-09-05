@echo off

set CHROMIUM_DIR=X:
set IN_CHROMIUM_BUILDER=1

set DEPOT_TOOLS_WIN_TOOLCHAIN=0
set NINJA_SUMMARIZE_BUILD=1

set PATH=%CHROMIUM_DIR%\depot_tools;%CHROMIUM_DIR%\scripts;%PATH%

title Chromium Shell

cmd /c "git config --global core.autocrlf false"
cmd /c "git config --global core.filemode false"
cmd /c "git config --global branch.autosetuprebase always"

cmd /k cd %CHROMIUM_DIR%\depot_tools