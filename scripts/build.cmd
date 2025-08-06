@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd chromium\src
cmd /c "gn gen out\stable-windows-amd64"
cmd /c "autoninja -C out/stable-windows-amd64 chrome_official_builder_no_unittests pack_policy_templates"
cd ..\..