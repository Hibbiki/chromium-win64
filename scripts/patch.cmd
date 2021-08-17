@echo off

IF NOT DEFINED IN_CHROMIUM_BUILDER (goto :EOF)
cd %CHROMIUM_DIR%\depot_tools

cd src
FOR %%f IN (%CHROMIUM_DIR%\patch\*.patch) DO git am --signoff < %%f
cd ..

@rem vpython is used for autoninja on standalone but httplib2 is only present for python
cd src\chrome
cmd /c "vpython -m pip install httplib2"
cd ..\..