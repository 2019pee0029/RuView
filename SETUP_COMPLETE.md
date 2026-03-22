# RuView Environment Setup - Complete Guide

## ✅ Status

1. **Virtual Environment Created** ✓
   - Location: `venv/` directory in the project root
   - Python Version: Python 3.13
   - Status: Ready for dependency installation

2. **Helper Setup Scripts Created** ✓
   - `setup-env.sh` — For MSYS64/Git Bash users
   - `setup-env.bat` — For Windows Command Prompt users
   - `ENVIRONMENT_SETUP.md` — Detailed setup documentation

## 🚀 Quick Start

### Option 1: Run the Automated Setup Script (Recommended)

#### For MSYS64/Git Bash:
```bash
cd c:\msys64\home\AIJAZ\RuView\RuView
bash setup-env.sh
```

#### For Windows Command Prompt:
```cmd
cd c:\msys64\home\AIJAZ\RuView\RuView
setup-env.bat
```

### Option 2: Manual Setup

#### Step 1: Activate Virtual Environment

**MSYS64/Git Bash:**
```bash
source venv/bin/activate
```

**Command Prompt:**
```cmd
venv\Scripts\activate.bat
```

**PowerShell:**
```powershell
venv\Scripts\Activate.ps1
```

#### Step 2: Install All Dependencies

Once activated, run:
```bash
pip install -r requirements.txt
```

**Alternatively, install in smaller batches:**

```bash
# Testing & utilities
pip install pytest pytest-asyncio pytest-mock pytest-benchmark httpx pydantic-settings

# Web framework
pip install fastapi uvicorn websockets pydantic python-jose python-multipart passlib

# Database
pip install sqlalchemy asyncpg aiosqlite redis

# Hardware & async
pip install asyncio-mqtt aiohttp paramiko

# Data processing
pip install opencv-python scikit-learn

# Development tools
pip install black flake8 mypy click alembic prometheus-client

# Machine Learning (last, as this is the largest)
pip install numpy scipy
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
```

## ⏱️ Expected Installation Time

- **First-time full install**: 10-20 minutes (PyTorch compilation on Windows can be slow)
- **Using pre-built wheels**: 5-10 minutes
- **Updates only**: 1-2 minutes

## ✨ Verification

Once installation is complete, verify everything works:

```bash
# Activate environment
source venv/bin/activate  # or venv\Scripts\activate.bat on Windows

# Test Python
python --version

# Test key packages
python -c "import torch, fastapi, numpy, pytest; print('✓ All key packages installed!')"

# List all installed packages
pip list

# Run tests
pytest tests/ -v
```

## 📋 Project Structure After Setup

```
RuView/
├── venv/                    ← Virtual environment (ignore in git)
├── setup-env.sh             ← Bash setup script
├── setup-env.bat            ← Windows setup script
├── requirements.txt         ← Dependency list
├── .env                     ← Configuration (copy from example.env)
├── v1/                      ← Python source code
├── rust-port/               ← Rust implementation
├── docs/                    ← Documentation
├── firmware/                ← ESP32 firmware
├── ui/                      ← Web UI
└── tests/                   ← Test suite
```

## 🔧 Troubleshooting

### Problem: "ModuleNotFoundError: No module named 'xxx'"

**Solution:** Make sure you've activated the virtual environment:
```bash
source venv/bin/activate  # MSYS64/Bash
# or
venv\Scripts\activate.bat  # Windows CMD
```

### Problem: pip install hangs

**Solution:** Try installing with `--no-cache-dir`:
```bash
pip install --no-cache-dir -r requirements.txt
```

### Problem: Compilation errors for numpy/torch

**Solution:** 
1. Ensure you have build tools installed (MSYS64):
   ```bash
   pacman -S base-devel mingw-w64-x86_64-toolchain
   ```

2. Or use pre-built wheels only:
   ```bash
   pip install --only-binary=:all: -r requirements.txt
   ```

### Problem: "error: externally-managed-environment"

**Solution:** This means Python detected you're in a system Python. Ensure you're using the venv:
```bash
which python  # Should show path to venv/bin/python
source venv/bin/activate
```

### Problem: PyTorch is too large to download

**Solution:** Install a CPU-only version which is smaller:
```bash
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
```

## 📝 Environment Variables

Create a `.env` file from the template:
```bash
cp example.env .env
```

Edit `.env` with your configuration (database URL, API keys, etc.)

## 🚀 Running the Application

After setup completes, you can run the application:

```bash
# Activate environment
source venv/bin/activate

# Start the API server
uvicorn wifi_densepose.api.main:app --reload --host 0.0.0.0 --port 8000

# In another terminal, you can run the CLI
python -m wifi_densepose.cli --help

# Or run tests
pytest tests/ -v --tb=short
```

## 📚 Next Steps

1. **Complete the environment setup** using steps above
2. **Review the documentation**:
   - `README.md` — Project overview
   - `docs/user-guide.md` — Usage guide
   - `docs/build-guide.md` — Build instructions
   
3. **Explore the codebase**:
   - `v1/src/` — Python implementation
   - `rust-port/` — Rust implementation
   - `firmware/` — ESP32 firmware

4. **Run tests to verify everything works**:
   ```bash
   pytest tests/ -x
   ```

5. **Start development**:
   ```bash
   # Make sure venv is activated
   source venv/bin/activate
   
   # Run the API
   uvicorn wifi_densepose.api.main:app --reload
   ```

## 💡 Tips

- **Always activate the venv before working**: `source venv/bin/activate`
- **Add venv/ to .gitignore**: `echo "venv/" >> .gitignore`
- **Keep requirements.txt updated**: `pip freeze > requirements.txt`
- **Use PyCharm or VS Code**: They can auto-detect and use the venv

## 🆘 Need Help?

- Check `ENVIRONMENT_SETUP.md` for detailed setup guide
- Review `CLAUDE.md` for project architecture
- Check `README.md` for project documentation
- Open an issue on GitHub if you encounter problems

---

**Created**: March 22, 2026  
**Virtual Environment**: `venv/`  
**Python Version**: 3.13+  
**Platform**: Windows/MSYS64
