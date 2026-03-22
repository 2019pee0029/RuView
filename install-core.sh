#!/bin/bash
# Quick fix: Install core dependencies only (avoids scipy/numpy build issues)
# Then optionally add scientific packages

set -e

echo "Installing core dependencies..."
source venv/bin/activate

# Upgrade pip using python.exe -m (MINGW64 workaround)
python.exe -m pip install --quiet --upgrade pip

# Install ONLY core packages that have pure-Python wheels
python.exe -m pip install --quiet \
  fastapi==0.95.0 \
  uvicorn==0.20.0 \
  pytest==7.0.0 \
  click==8.0.0

echo ""
echo "✓ Core environment ready! (4 packages, zero compilation)"
echo ""
echo "To add optional packages later, you can try:"
echo ""
echo "Option 1: Install pure-Python packages"
echo "  pip install websockets pyyaml"
echo ""
echo "Option 2: Install NumPy/SciPy (requires build tools)"
echo "  pacman -S mingw-w64-x86_64-openblas mingw-w64-x86_64-gcc-fortran"
echo "  pip install numpy scipy"
echo ""
echo "Option 3: Use Docker (easiest for full stack)"
echo "  docker pull ruvnet/wifi-densepose:latest"
echo ""
