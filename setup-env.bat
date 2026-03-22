@echo off
REM RuView Environment Setup Script for Windows
REM This script creates a virtual environment and installs all dependencies

echo.
echo ================================
echo RuView Environment Setup
echo ================================
echo.

REM Step 1: Clean up old environments
echo [1/4] Cleaning up old environments...
if exist venv (
    echo Removing old venv...
    rmdir /s /q venv
)
if exist venv_fresh (
    echo Removing old venv_fresh...
    rmdir /s /q venv_fresh
)
echo.

REM Step 2: Create new virtual environment
echo [2/4] Creating new virtual environment...
python -m venv venv
echo Virtual environment created at .\venv
echo.

REM Step 3: Activate and upgrade pip
echo [3/4] Upgrading pip and build tools...
call venv\Scripts\activate.bat
python.exe -m pip install --quiet --upgrade pip setuptools wheel
echo.

REM Step 4: Install core requirements
echo [4/5] Installing core dependencies...
python.exe -m pip install --quiet --prefer-binary -r requirements-core.txt

if %errorlevel% equ 0 (
    echo Core dependencies installed
) else (
    echo Warning: Core dependencies had issues, but continuing...
)

REM Step 5: Install optional scientific packages
echo.
echo [5/5] Installing optional scientific packages...
echo Note: This may fail if build tools are not properly configured.
echo The application will work without these, but ML features may be limited.
python.exe -m pip install --quiet --prefer-binary -r requirements-optional.txt

if %errorlevel% equ 0 (
    echo Scientific packages installed
) else (
    echo Scientific packages skipped (optional)
)

echo.
echo ================================
echo Setup Complete!
echo ================================
echo.
echo To activate the environment, run:
echo   venv\Scripts\activate.bat
echo.
echo To verify the installation:
echo   python -c "import torch; import fastapi; print('All dependencies installed!')"
echo.
echo To start the API server:
echo   uvicorn wifi_densepose.api.main:app --reload
echo.
pause
