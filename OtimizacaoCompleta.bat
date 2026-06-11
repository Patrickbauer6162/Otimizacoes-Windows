@echo off
setlocal EnableDelayedExpansion
title HSRoficial - Otimizacao Completa do Windows

echo ==========================================
echo   HSRoficial - Otimizacao Completa
echo   youtube.com/@HSRoficial
echo ==========================================
echo.
echo  ATENCAO: Execute como Administrador!
echo  Crie um ponto de restauracao antes!
echo ==========================================
echo.

:: Verifica se e administrador
net session >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Execute este arquivo como Administrador!
    pause
    exit /b
)

:MENU
echo Escolha uma opcao:
echo.
echo [1] Aplicar TODOS os tweaks (recomendado)
echo [2] NetworkThrottling + SystemResponsiveness
echo [3] GPU Priority (Tasks/Games)
echo [4] Desativar MPO (anti-stutter)
echo [5] Input Lag Mouse e Teclado
echo [6] Ajuste de SvcHost por RAM
echo [7] Sair
echo.
set /p OPCAO=Digite a opcao:

if "%OPCAO%"=="1" goto TODOS
if "%OPCAO%"=="2" goto NETWORK
if "%OPCAO%"=="3" goto GPU
if "%OPCAO%"=="4" goto MPO
if "%OPCAO%"=="5" goto INPUTLAG
if "%OPCAO%"=="6" goto SVCHOST
if "%OPCAO%"=="7" exit /b
goto MENU

:TODOS
echo.
echo [*] Aplicando todos os tweaks...
call :APPLY_NETWORK
call :APPLY_GPU
call :APPLY_MPO
call :APPLY_INPUTLAG
call :APPLY_SVCHOST
echo.
echo [OK] Todos os tweaks aplicados!
echo [!] Reinicie o PC para aplicar completamente.
goto FIM

:NETWORK
call :APPLY_NETWORK
goto FIM

:GPU
call :APPLY_GPU
goto FIM

:MPO
call :APPLY_MPO
goto FIM

:INPUTLAG
call :APPLY_INPUTLAG
goto FIM

:SVCHOST
call :APPLY_SVCHOST
goto FIM

:: ---- FUNCOES ----

:APPLY_NETWORK
echo [*] NetworkThrottling + SystemResponsiveness...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
echo [OK] NetworkThrottling aplicado.
exit /b

:APPLY_GPU
echo [*] GPU Priority para jogos...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul
echo [OK] GPU Priority aplicado.
exit /b

:APPLY_MPO
echo [*] Desativando MPO...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f >nul
echo [OK] MPO desativado (reinicie para aplicar).
exit /b

:APPLY_INPUTLAG
echo [*] Reduzindo Input Lag de Mouse e Teclado...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 30 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 30 /f >nul
echo [OK] Input Lag de perifericos ajustado.
exit /b

:APPLY_SVCHOST
echo [*] Calculando ajuste de SvcHost para sua RAM...
for /f "tokens=2 delims==" %%A in ('wmic os get TotalVisibleMemorySize /value') do set RAM=%%A
set /a RAM_GB=!RAM!/1024/1024

echo     RAM detectada: ~!RAM_GB! GB

if !RAM_GB! LEQ 4  set SPLIT=4194304
if !RAM_GB! GEQ 5  set SPLIT=6291456
if !RAM_GB! GEQ 7  set SPLIT=8388608
if !RAM_GB! GEQ 11 set SPLIT=12582912
if !RAM_GB! GEQ 14 set SPLIT=16777216
if !RAM_GB! GEQ 20 set SPLIT=25165824
if !RAM_GB! GEQ 28 set SPLIT=33554432
if !RAM_GB! GEQ 56 set SPLIT=67108864

echo     Valor SvcHostSplitThresholdInKB: !SPLIT!
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d !SPLIT! /f >nul
echo [OK] SvcHost ajustado para !RAM_GB! GB de RAM.
exit /b

:FIM
echo.
pause
goto MENU
