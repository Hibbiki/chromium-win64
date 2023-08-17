@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

FOR /F "tokens=* USEBACKQ" %%F IN (`type ..\out\revision`) DO (
  SET rev=%%F
)

echo Preparing %rev%
echo.
copy /Y src\out\stable-sync-x64\mini_installer.exe ..\out\x64\mini_installer.sync.exe
copy /Y src\out\stable-sync-x64\chrome.7z ..\out\x64\chrome.sync.7z
copy /Y src\out\stable-nosync-x64\mini_installer.exe ..\out\x64\mini_installer.nosync.exe
copy /Y src\out\stable-nosync-x64\chrome.7z ..\out\x64\chrome.nosync.7z
copy /Y src\out\stable-undefined-noarch\policy_templates.zip ..\out\noarch\policy_templates.zip
echo.
cmd /c "wsl sha1sum ../out/x64/mini_installer.sync.exe"
cmd /c "wsl sha1sum ../out/x64/chrome.sync.7z"
cmd /c "wsl sha1sum ../out/x64/mini_installer.nosync.exe"
cmd /c "wsl sha1sum ../out/x64/chrome.nosync.7z"
cmd /c "wsl sha1sum ../out/noarch/policy_templates.zip"