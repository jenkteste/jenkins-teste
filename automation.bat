@echo off

for /f "delims=" %%a in ('dir /b *.txt') do (
    echo Procurando por arquivo %%a

  for /f "delims=;" %%b IN (%%a) DO ECHO %%b



)