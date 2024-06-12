@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd src
cmd /c "gn gen out\stable-sync-x64"
cmd /c "autoninja -C out/stable-sync-x64 chrome_official_builder_no_unittests"
cmd /c "gn gen out\stable-nosync-x64"
cmd /c "autoninja -C out/stable-nosync-x64 chrome_official_builder_no_unittests"

cmd /c "gn clean out\stable-undefined-noarch"
cmd /c "gn gen out\stable-undefined-noarch"
cmd /c "autoninja -C out/stable-undefined-noarch pack_policy_templates"
cd ..