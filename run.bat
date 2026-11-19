@echo off
REM Starts the Grocery Inventory System on Windows
cd /d "%~dp0"
python frontend\app.py
if errorlevel 1 pause
