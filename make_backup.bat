rem **************************************
rem * Vulkan lib backup tool             *
rem * version 1                          *
rem * by Octanium91                      *
rem **************************************
@echo off
title= Vulkan libs backup by Octanium91
set "backUpFolder=%~dp0backups"
echo.
echo  Make vulkan libs backup?
echo.
pause

cls
echo.
echo  Start make backup...
set timeStamp=%date:~6,8%%date:~3,2%%date:~0,2%%time:~0,2%%time:~3,2%%time:~6,2%
if not exist "%backUpFolder%" mkdir "%backUpFolder%"
set "backUpFolderEntity=%backUpFolder%\vulkanLibs%timeStamp%"
if not exist "%backUpFolderEntity%" mkdir "%backUpFolderEntity%"
echo.
if exist "%systemroot%\system32" (
    echo  Copy libs from %systemroot%\system32
    if not exist "%backUpFolderEntity%\system32" mkdir "%backUpFolderEntity%\system32"
    if exist "%systemroot%\system32\vulkan-1.dll" copy /y "%systemroot%\system32\vulkan-1.dll" "%backUpFolderEntity%\system32\vulkan-1.dll"
    if exist "%systemroot%\system32\vulkan-1-999-0-0-0.dll" copy /y "%systemroot%\system32\vulkan-1-999-0-0-0.dll" "%backUpFolderEntity%\system32\vulkan-1-999-0-0-0.dll"
    if exist "%systemroot%\system32\vulkaninfo.exe" copy /y "%systemroot%\system32\vulkaninfo.exe" "%backUpFolderEntity%\system32\vulkaninfo.exe"
    if exist "%systemroot%\system32\vulkaninfo-1-999-0-0-0.exe" copy /y "%systemroot%\system32\vulkaninfo-1-999-0-0-0.exe" "%backUpFolderEntity%\system32\vulkaninfo-1-999-0-0-0.exe"
)
if exist "%systemroot%\SysWOW64" (
    echo  Copy libs from %systemroot%\SysWOW64
    if not exist "%backUpFolderEntity%\SysWOW64" mkdir "%backUpFolderEntity%\SysWOW64"
    if exist "%systemroot%\SysWOW64\vulkan-1.dll" copy /y "%systemroot%\SysWOW64\vulkan-1.dll" "%backUpFolderEntity%\SysWOW64\vulkan-1.dll"
    if exist "%systemroot%\SysWOW64\vulkan-1-999-0-0-0.dll" copy /y "%systemroot%\SysWOW64\vulkan-1-999-0-0-0.dll" "%backUpFolderEntity%\SysWOW64\vulkan-1-999-0-0-0.dll"
    if exist "%systemroot%\SysWOW64\vulkaninfo.exe" copy /y "%systemroot%\SysWOW64\vulkaninfo.exe" "%backUpFolderEntity%\SysWOW64\vulkaninfo.exe"
    if exist "%systemroot%\SysWOW64\vulkaninfo-1-999-0-0-0.exe" copy /y "%systemroot%\SysWOW64\vulkaninfo-1-999-0-0-0.exe" "%backUpFolderEntity%\SysWOW64\vulkaninfo-1-999-0-0-0.exe"
)
echo.
echo  Create restore script...
set "restoreFile=%backUpFolderEntity%\restore.bat"
echo @echo off>>"%restoreFile%"
echo title= Vulkan libs restore by Octanium91>>"%restoreFile%"
echo echo.>>"%restoreFile%"
echo echo  Files: >>"%restoreFile%"
echo echo  - vulkan-1.dll >>"%restoreFile%"
if exist "%systemdrive%\windows\system32\vulkan-1.dll" (
    for /f "usebackq delims=" %%a in (`"WMIC DATAFILE WHERE name='%systemdrive%\\Windows\\system32\\vulkan-1.dll' get Version /format:Textvaluelist"`) do (
        for /f "delims=" %%b in ("%%a") do echo echo    * %%b >>"%restoreFile%"
    )
)
echo echo  - vulkan-1-999-0-0-0.dll >>"%restoreFile%"
if exist "%systemdrive%\windows\system32\vulkan-1-999-0-0-0.dll" (
    for /f "usebackq delims=" %%a in (`"WMIC DATAFILE WHERE name='%systemdrive%\\Windows\\system32\\vulkan-1-999-0-0-0.dll' get Version /format:Textvaluelist"`) do (
        for /f "delims=" %%b in ("%%a") do echo echo    * %%b >>"%restoreFile%"
    )
)
echo echo  - vulkaninfo.exe >>"%restoreFile%"
if exist "%systemdrive%\windows\system32\vulkaninfo.exe" (
    for /f "usebackq delims=" %%a in (`"WMIC DATAFILE WHERE name='%systemdrive%\\Windows\\system32\\vulkaninfo.exe' get Version /format:Textvaluelist"`) do (
        for /f "delims=" %%b in ("%%a") do echo echo    * %%b >>"%restoreFile%"
    )
)
echo echo  - vulkaninfo-1-999-0-0-0.exe >>"%restoreFile%"
if exist "%systemdrive%\windows\system32\vulkaninfo-1-999-0-0-0.exe" (
    for /f "usebackq delims=" %%a in (`"WMIC DATAFILE WHERE name='%systemdrive%\\Windows\\system32\\vulkaninfo-1-999-0-0-0.exe' get Version /format:Textvaluelist"`) do (
        for /f "delims=" %%b in ("%%a") do echo echo    * %%b >>"%restoreFile%"
    )
)
echo echo.>>"%restoreFile%"
echo echo  Restore vulkan libs?>>"%restoreFile%"
echo echo.>>"%restoreFile%"
echo pause>>"%restoreFile%"
echo.>>"%restoreFile%"
echo echo.>>"%restoreFile%"
echo echo  Restoring libs...>>"%restoreFile%"
echo echo.>>"%restoreFile%"
if exist "%backUpFolderEntity%\system32" (
    echo echo  Copy libs in %%systemroot%%\system32>>"%restoreFile%"
    echo if exist "%%~dp0system32\vulkan-1.dll" copy /y "%%~dp0system32\vulkan-1.dll" "%%systemroot%%\system32\vulkan-1.dll">>"%restoreFile%"
    echo if exist "%%~dp0system32\vulkan-1.dll" copy /y "%%~dp0system32\vulkan-1-999-0-0-0.dll" "%%systemroot%%\system32\vulkan-1-999-0-0-0.dll">>"%restoreFile%"
    echo if exist "%%~dp0system32\vulkaninfo.exe" copy /y "%%~dp0system32\vulkaninfo.exe" "%%systemroot%%\system32\vulkaninfo.exe">>"%restoreFile%"
    echo if exist "%%~dp0system32\vulkaninfo-1-999-0-0-0.exe" copy /y "%%~dp0system32\vulkaninfo-1-999-0-0-0.exe" "%systemroot%\system32\vulkaninfo-1-999-0-0-0.exe">>"%restoreFile%"
)
if exist "%backUpFolderEntity%\SysWOW64" (
    echo echo  Copy libs in %%systemroot%%\SysWOW64>>"%restoreFile%"
    echo if exist "%%~dp0SysWOW64\vulkan-1.dll" copy /y "%%~dp0SysWOW64\vulkan-1.dll" "%%systemroot%%\SysWOW64\vulkan-1.dll">>"%restoreFile%"
    echo if exist "%%~dp0SysWOW64\vulkan-1.dll" copy /y "%%~dp0SysWOW64\vulkan-1-999-0-0-0.dll" "%%systemroot%%\SysWOW64\vulkan-1-999-0-0-0.dll">>"%restoreFile%"
    echo if exist "%%~dp0SysWOW64\vulkaninfo.exe" copy /y "%%~dp0SysWOW64\vulkaninfo.exe" "%%systemroot%%\SysWOW64\vulkaninfo.exe">>"%restoreFile%"
    echo if exist "%%~dp0SysWOW64\vulkaninfo-1-999-0-0-0.exe" copy /y "%%~dp0SysWOW64\vulkaninfo-1-999-0-0-0.exe" "%%systemroot%%\SysWOW64\vulkaninfo-1-999-0-0-0.exe">>"%restoreFile%"
)
echo echo.>>"%restoreFile%"
echo echo  Done!>>"%restoreFile%"
echo echo.>>"%restoreFile%"
echo pause>>"%restoreFile%"
echo exit>>"%restoreFile%"
echo  Restore script created!
echo  Backup created in %backUpFolderEntity%
echo.
pause
exit