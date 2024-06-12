@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

FOR /F "tokens=* USEBACKQ" %%F IN (`type ..\out\revision`) DO (
  SET VERSION=%%F
)

echo Preparing %VERSION%
echo.
call :GetInstaller "stable-sync-x64" "mini_installer.sync.exe"
call :GetArchive "stable-sync-x64" "chrome.sync.7z"
call :GetInstaller "stable-nosync-x64" "mini_installer.nosync.exe"
call :GetArchive "stable-nosync-x64" "chrome.nosync.7z"
call :GetPolicyTemplates
echo.
call :GetChecksum "x64/mini_installer.sync.exe"
call :GetChecksum "x64/chrome.sync.7z"
call :GetChecksum "x64/mini_installer.nosync.exe"
call :GetChecksum "x64/chrome.nosync.7z"
call :GetChecksum "noarch/policy_templates.zip"
goto :eof

:GetUpdater
cmd /q /c python3 src\out\%~1\UpdaterSigning\sign.py --in_file src\out\%~1\UpdaterSetup.exe --out_file %CHROMIUM_DIR%\out\x64\%~2 ^
  --appid {7D2B3E1D-D096-4594-9D8F-A6667F12E0AC} ^
  --installer_path src\out\%~1\mini_installer.exe ^
  --manifest_path %CHROMIUM_DIR%\installer\OfflineManifest.gup ^
  --lzma_7z "C:/Program Files/7-Zip/7z.exe" ^
  --manifest_dict_replacements "{'${INSTALLER_VERSION}':'%VERSION%', '${ARCH_REQUIREMENT}':'x64'}"
exit /b

:GetInstaller
copy /Y src\out\%~1\mini_installer.exe %CHROMIUM_DIR%\out\x64\%~2
exit /b

:GetArchive
copy /Y src\out\%~1\chrome.7z %CHROMIUM_DIR%\out\x64\%~2
exit /b

:GetPolicyTemplates
copy /Y src\out\stable-undefined-noarch\policy_templates.zip %CHROMIUM_DIR%\out\noarch\policy_templates.zip
exit /b

:GetChecksum
cmd /c "pushd %CHROMIUM_DIR% && wsl sha1sum ../out/%~1"
exit /b