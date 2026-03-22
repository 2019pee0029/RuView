#!/bin/bash
# RuView FINAL WORKING SETUP
# This uses Docker since Python MINGW64 has too many compilation issues

set -e

echo "==============================================="
echo "RuView Setup - WORKING SOLUTION"
echo "==============================================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed."
    echo ""
    echo "Option 1: Install Docker Desktop"
    echo "  Download from: https://www.docker.com/products/docker-desktop"
    echo ""
    echo "Option 2: Use Windows Python (not MSYS2)"
    echo "  Install Python 3.13 from python.org"
    echo "  It has pre-built wheels for all packages"
    echo ""
    exit 1
fi

echo "Docker found! Pulling the official image..."
echo ""

docker pull ruvnet/wifi-densepose:latest

echo ""
echo "==============================================="
echo "✓ Done! Start the API with:"
echo "==============================================="
echo ""
echo "  docker run --rm -p 8000:8000 -p 3000:3000 ruvnet/wifi-densepose:latest"
echo ""
echo "Then open:"
echo "  http://localhost:8000/docs"
echo ""
