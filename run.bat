@echo off
title Project Submission Portal - Launcher
color 0A

:: ─────────────────────────────────────────────
::  CONFIGURATION  (edit these if paths differ)
:: ─────────────────────────────────────────────
set JAVA_HOME=C:\Program Files\Java\jdk-25
set MAVEN=C:\maven\apache-maven-3.9.15\bin\mvn.cmd
set TOMCAT=C:\apache-tomcat-9.0.117-windows-x64\apache-tomcat-9.0.117
set APP_URL=http://localhost:8080/project-submission-portal/
set PROJECT_DIR=%~dp0

echo.
echo  ==========================================
echo   Project Submission Portal - Launcher
echo  ==========================================
echo.

:: ── Step 1: Build ──────────────────────────
echo  [1/3] Building project with Maven...
echo.
call "%MAVEN%" clean package -f "%PROJECT_DIR%pom.xml"
if %ERRORLEVEL% neq 0 (
    color 0C
    echo.
    echo  !! BUILD FAILED !! See errors above.
    echo.
    pause
    exit /b 1
)
echo.
echo  Build SUCCESS.
echo.

:: ── Step 2: Stop any running Tomcat ────────
echo  [2/3] Stopping any existing Tomcat...
taskkill /f /im "tomcat9.exe" >nul 2>&1
taskkill /f /fi "WINDOWTITLE eq Tomcat*" >nul 2>&1
timeout /t 2 /nobreak >nul

:: ── Step 3: Deploy WAR ─────────────────────
echo  Deploying WAR to Tomcat...
if exist "%TOMCAT%\webapps\project-submission-portal.war" (
    del /f /q "%TOMCAT%\webapps\project-submission-portal.war"
)
if exist "%TOMCAT%\webapps\project-submission-portal" (
    rmdir /s /q "%TOMCAT%\webapps\project-submission-portal"
)
copy /y "%PROJECT_DIR%target\project-submission-portal.war" "%TOMCAT%\webapps\" >nul
if %ERRORLEVEL% neq 0 (
    color 0C
    echo.
    echo  !! Could not copy WAR to Tomcat. Check the TOMCAT path in this script.
    echo.
    pause
    exit /b 1
)
echo  WAR deployed successfully.
echo.

:: ── Step 4: Start Tomcat ───────────────────
echo  [3/3] Starting Tomcat server...
set CATALINA_HOME=%TOMCAT%
set CATALINA_BASE=%TOMCAT%
start "Tomcat - Project Submission Portal" /min cmd /c ""%TOMCAT%\bin\catalina.bat" run & pause"

:: Wait for Tomcat to be ready
echo  Waiting for server to start...
set /a tries=0
:waitloop
timeout /t 2 /nobreak >nul
set /a tries+=1
powershell -command "try { $r = Invoke-WebRequest -Uri '%APP_URL%' -UseBasicParsing -TimeoutSec 2; exit 0 } catch { exit 1 }" >nul 2>&1
if %ERRORLEVEL% equ 0 goto ready
if %tries% lss 10 goto waitloop

:: If we get here, server didn't respond in time
color 0E
echo.
echo  Server is taking longer than expected.
echo  Check the Tomcat window in the taskbar for errors.
echo  Then try opening: %APP_URL%
echo.
pause
exit /b 0

:ready
color 0A
echo  Server is UP!
echo.
echo  ==========================================
echo   Opening: %APP_URL%
echo  ==========================================
echo.
start "" "%APP_URL%"

echo  Press any key to EXIT this window.
echo  (Tomcat keeps running in the background)
echo.
pause
