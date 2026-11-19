@echo off
REM OPTIONAL: compile the Java backend by hand (the GUI also does this automatically).
cd /d "%~dp0"
if not exist out mkdir out
javac -encoding UTF-8 -cp lib\gson.jar -d out backend\*.java
if errorlevel 1 (echo COMPILE FAILED) else (echo Compiled OK into the "out" folder)
pause
