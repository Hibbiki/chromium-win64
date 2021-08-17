@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

FOR /F "tokens=* USEBACKQ" %%F IN (`bash stable.sh`) DO (
  SET rev=%%F
)

cd src
cmd /c "git reset --hard"
cmd /c "git -c core.deltaBaseCacheLimit=2g fetch --tags --progress"
cmd /c "git checkout %rev%"
cmd /c "gclient sync --with_branch_heads -f -R -D"
del /Q out\stable-sync-x64\*.manifest
del /Q out\stable-nosync-x64\*.manifest
cd ..

call patch.cmd