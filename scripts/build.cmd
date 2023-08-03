@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd src
cmd /c "gn gen out\stable-sync-x64"
cmd /c "autoninja -C out/stable-sync-x64 mini_installer.exe"
cmd /c "gn gen out\stable-nosync-x64"
cmd /c "autoninja -C out/stable-nosync-x64 mini_installer.exe"

cmd /c "gn gen out\stable-undefined-noarch"
cmd /c "autoninja -C out/stable-undefined-noarch -t clean"
cmd /c "autoninja -C out/stable-undefined-noarch generate_version_info policy_templates pack_policy_templates"
cd ..