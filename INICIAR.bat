@echo off
title Sistema Papelaria
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0INICIAR.ps1"
pause
