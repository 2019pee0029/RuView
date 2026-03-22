#!/bin/bash

# RuView Environment Setup Script for MSYS64
# This script creates a virtual environment and installs all dependencies

set -e

echo "================================"
echo "RuView Environment Setup"
echo "================================"
echo ""

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Step 1: Clean up old environments
echo -e "${BLUE}[1/4]${NC} Cleaning up old environments..."
if [ -d "venv" ]; then
    echo "Removing old venv..."
    rm -rf venv
fi
if [ -d "venv_fresh" ]; then
    echo "Removing old venv_fresh..."
    rm -rf venv_fresh
fi
echo -e "${GREEN}✓ Old environments cleaned${NC}"
echo ""

# Step 2: Create new virtual environment
echo -e "${BLUE}[2/4]${NC} Creating new virtual environment..."
python -m venv venv
echo -e "${GREEN}✓ Virtual environment created at ./venv${NC}"
echo ""

# Step 3: Activate and upgrade pip
echo -e "${BLUE}[3/4]${NC} Upgrading pip and build tools..."
source venv/bin/activate
python.exe -m pip install --quiet --upgrade pip setuptools wheel
echo -e "${GREEN}✓ Pip upgraded${NC}"
echo ""

# Step 4: Install core requirements
echo -e "${BLUE}[4/5]${NC} Installing core dependencies..."
python.exe -m pip install --quiet --prefer-binary -r requirements-core.txt

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Core dependencies installed${NC}"
else
    echo -e "${GREEN}⚠ Core dependencies had issues, but continuing...${NC}"
fi
echo ""

# Step 5: Install optional scientific packages
echo -e "${BLUE}[5/5]${NC} Installing optional scientific packages..."
echo "Note: This may fail if build tools are not properly configured."
echo "The application will work without these, but ML features may be limited."
python.exe -m pip install --quiet --prefer-binary -r requirements-optional.txt 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Scientific packages installed${NC}"
else
    echo -e "${BLUE}ℹ Scientific packages skipped (optional)${NC}"
fi

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}✓ Setup Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "To activate the environment, run:"
echo "  source venv/bin/activate"
echo ""
echo "To verify the installation:"
echo "  python -c \"import torch; import fastapi; print('All dependencies installed!')\""
echo ""
echo "To start the API server:"
echo "  cd v1 && uvicorn api.main:app --reload"
echo ""
