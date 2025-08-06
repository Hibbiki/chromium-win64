@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

FOR /F "tokens=* USEBACKQ" %%F IN (`bash version.sh %*`) DO (
  SET VERSION=%%F
)

call clean.cmd

cd chromium\src
cmd /c "git reset --hard"
cmd /c "git -c core.deltaBaseCacheLimit=2g fetch --tags --progress"
cmd /c "git checkout %VERSION%"
cmd /c "gclient sync --with_branch_heads -f -R -D"
cmd /c "python3 -m pip install pywin32"
cd ..\..

call patch.cmd