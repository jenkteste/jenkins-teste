@echo off

setlocal enableextensions disabledelayedexpansion


for /f "delims=" %%a in ('dir /b typequery.txt') do (
    echo Procurando por arquivo %%a
)