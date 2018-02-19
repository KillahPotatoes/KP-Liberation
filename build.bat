@echo off

rem Check that https://nodejs.org/en/download/ exists before continuing
where /q node
if ERRORLEVEL 1 (
    echo node is missing. Ensure it is installed. It can be downloaded from:
    echo https://nodejs.org/en/download/
    timeout 30
    exit /b
)

rem CD into build tool directory
cd %~dp0_tools

rem Install dependencies and build missions
call npm install --loglevel=error
call npx gulp

echo.

pause
exit /b
