@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

FOR /F "tokens=* USEBACKQ" %%F IN (`type ..\out\revision`) DO (
  SET rev=%%F
)

echo Publishing %rev%
echo.
call out.cmd
echo.
cmd /c "wsl sha1sum ../out/x64/mini_installer.sync.exe"
cmd /c "wsl sha1sum ../out/x64/chrome.sync.7z"
cmd /c "wsl sha1sum ../out/x64/mini_installer.nosync.exe"
cmd /c "wsl sha1sum ../out/x64/chrome.nosync.7z"
cmd /c "wsl sha1sum ../out/noarch/policy_templates.zip"
echo.