#!/bin/bash

# RuView Basic Quickstart — One command to get running!

set -e

echo "================================"
echo "RuView Basic Quickstart"
echo "================================"
echo ""

VENV_DIR="venv"

# Step 1: Create venv
echo "[1/4] Creating virtual environment..."
if [ -d "$VENV_DIR" ]; then
    echo "Removing old venv..."
    rm -rf "$VENV_DIR"
fi
python -m venv "$VENV_DIR"
echo "✓ Virtual environment created"
echo ""

# Step 2: Activate and install dependencies
echo "[2/4] Installing core dependencies (no compilation)..."
source "$VENV_DIR/bin/activate"

# Upgrade pip using python.exe -m (MINGW64 workaround for pip self-upgrade)
python.exe -m pip install --quiet --upgrade pip

# Install ONLY pure-Python packages with no compilation required
# Skip packages that depend on cryptography, paramiko, aiohttp, etc.
python.exe -m pip install --quiet \
  fastapi==0.95.0 \
  uvicorn==0.20.0 \
  pytest==7.0.0 \
  click==8.0.0

echo "✓ Core dependencies installed (4 packages, zero compilation)"
echo ""

# Step 3: Test installation
echo "[3/4] Verifying installation..."
python -c "import fastapi; import pytest; print('✓ All imports successful')"
echo ""

# Step 4: Ready!
echo "[4/4] Setup complete!"
echo ""
echo "================================"
echo "✓ Ready to run!"
echo "================================"
echo ""
echo "Start the API server:"
echo "  source venv/bin/activate"
echo "  uvicorn wifi_densepose.api.main:app --reload --host 0.0.0.0 --port 8000"
echo ""
echo "Then open:"
echo "  http://localhost:8000/health"
echo ""
echo "Or test with curl:"
echo "  curl http://localhost:8000/health"
echo ""
echo "For more details, see: QUICKSTART.md"
echo ""
