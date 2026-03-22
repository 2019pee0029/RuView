@echo off
REM RuView Basic Quickstart — Windows Edition

echo.
echo ================================
echo RuView Basic Quickstart
echo ================================
echo.

REM Step 1: Create venv
echo [1/4] Creating virtual environment...
if exist venv (
    echo Removing old venv...
    rmdir /s /q venv
)
python -m venv venv
echo ✓ Virtual environment created
echo.

REM Step 2: Activate and install dependencies
echo [2/4] Installing core dependencies (no compilation)...
call venv\Scripts\activate.bat

REM Upgrade pip using python.exe -m (MINGW64 workaround for pip self-upgrade)
python.exe -m pip install --quiet --upgrade pip

REM Install ONLY pure-Python packages with no compilation required
REM Skip packages that depend on cryptography, paramiko, aiohttp, etc.
python.exe -m pip install --quiet ^
  fastapi==0.95.0 ^
  uvicorn==0.20.0 ^
  pytest==7.0.0 ^
  click==8.0.0

echo ✓ Core dependencies installed (4 packages, zero compilation)
echo.

REM Step 3: Test installation
echo [3/4] Verifying installation...
python -c "import fastapi; import pytest; print('✓ All imports successful')"
echo.

REM Step 4: Ready!
echo [4/4] Setup complete!
echo.
echo ================================
echo ✓ Ready to run!
echo ================================
echo.
echo Start the API server:
echo   venv\Scripts\activate.bat
echo   uvicorn wifi_densepose.api.main:app --reload --host 0.0.0.0 --port 8000
echo.
echo Then open:
echo   http://localhost:8000/health
echo.
echo Or test with curl:
echo   curl http://localhost:8000/health
echo.
echo For more details, see: QUICKSTART.md
echo.
pause
