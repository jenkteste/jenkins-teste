@echo off

setlocal enableextensions disabledelayedexpansion

for /f "delims=" %%a in ('dir /b *.txt') do (

    echo Procurando por arquivo %%a

    set "found="

    for /f "delims=" %%b in ('findstr /l /m /c:"%%~na" "*.txt"') do (

        echo %%a encontrado no arquivo %%~nb

        set "found=1"

    )

    if not defined found (

        echo %%a nao encontrado no arquivo

    )

)