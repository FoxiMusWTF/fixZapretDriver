@echo off
chcp 65001 >nul

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :run_commands
) else (
    goto :get_admin
)

:get_admin
    echo Запрос прав администратора...
    powershell -NoProfile -Command "Start-Process 'cmd.exe' -ArgumentList '/c \"\"%~f0\" admin\"' -Verb RunAs"
    exit /b

:run_commands
    chcp 65001 >nul
    
    sc stop windivert
    sc delete windivert
    
    echo Готово!
    pause
