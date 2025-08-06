@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

FOR /F "tokens=* USEBACKQ" %%F IN (`type ..\out\.revision`) DO (
  SET VERSION=%%F
)

echo Preparing %VERSION%
echo.
call :GetInstaller "stable-windows-amd64"
call :GetArchive "stable-windows-amd64"
call :GetPolicyTemplates "stable-windows-amd64"
echo.
call :GetChecksum "mini_installer.exe"
call :GetChecksum "chrome.7z"
call :GetChecksum "policy_templates.zip"
goto :eof

:GetUpdater
cmd /q /c python3 chromium\src\out\%~1\UpdaterSigning\sign.py --in_file chromium\src\out\%~1\UpdaterSetup.exe --out_file %CHROMIUM_DIR%\out\ChromiumSetup.exe ^
  --appid {7D2B3E1D-D096-4594-9D8F-A6667F12E0AC} ^
  --installer_path chromium\src\out\%~1\mini_installer.exe ^
  --manifest_path %CHROMIUM_DIR%\installer\OfflineManifest.gup ^
  --lzma_7z "C:/Program Files/7-Zip/7z.exe" ^
  --manifest_dict_replacements "{'${INSTALLER_VERSION}':'%VERSION%', '${ARCH_REQUIREMENT}':'x64'}"
exit /b

:GetInstaller
copy /Y chromium\src\out\%~1\mini_installer.exe %CHROMIUM_DIR%\out\mini_installer.exe
exit /b

:GetArchive
copy /Y chromium\src\out\%~1\chrome.7z %CHROMIUM_DIR%\out\chrome.7z
exit /b

:GetPolicyTemplates
copy /Y chromium\src\out\%~1\policy_templates.zip %CHROMIUM_DIR%\out\policy_templates.zip
exit /b

:GetChecksum
cmd /c "pushd %CHROMIUM_DIR% && wsl sha1sum ../out/%~1"
exit /b