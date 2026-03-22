#!/bin/bash
# Quick fix: Install core dependencies only (avoids scipy/numpy build issues)
# Then optionally add scientific packages

set -e

echo "Installing core dependencies..."
source venv/bin/activate

# Install core packages first (these have wheels)
pip install --prefer-binary \
  fastapi uvicorn pydantic pytest pytest-asyncio pytest-mock pytest-benchmark \
  httpx pydantic-settings websockets python-jose python-multipart passlib \
  sqlalchemy asyncpg aiosqlite redis click alembic \
  asyncio-mqtt aiohttp paramiko prometheus-client \
  black flake8 mypy

echo ""
echo "✓ Core environment ready!"
echo ""
echo "To add scientific packages (numpy/scipy/torch), choose an option:"
echo ""
echo "Option 1: Install openblas first, then scipy"
echo "  pacman -S mingw-w64-x86_64-openblas"
echo "  pip install --prefer-binary numpy scipy"
echo ""
echo "Option 2: Skip scientific packages (use CPU-only mode for now)"
echo "  pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu"
echo ""
echo "Option 3: Use conda instead (recommended for scientific stack on Windows)"
echo "  conda install -c conda-forge numpy scipy scikit-learn opencv"
