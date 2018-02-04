@echo off

rem check that makepbo exists before continuing
where /q makepbo
if ERRORLEVEL 1 (
    echo makepbo is missing. Ensure it is installed. It can be downloaded from:
    echo https://armaservices.maverick-applications.com/Products/MikerosDosTools/FileBrowserFree
    timeout 30
    exit /b
)

rem Remove and recreate build folder
if exist build rd /s /q build >NUL
if not exist build mkdir build >NUL

rem Create each mission with the framework files
for /D %%s in (Missionbasefiles\*) do (
	@echo %%~nxs
	xcopy %%s build\%%~nxs /s /e /i /q >NUL
	xcopy Missionframework\* build\%%~nxs /s /e /q >NUL
	makepbo -np build\%%~nxs build\%%~nxs.pbo >NUL
	rd /s /q build\%%~nxs >NUL
)
