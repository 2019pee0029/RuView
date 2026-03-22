# Environment Setup Guide

## Virtual Environment Created ✓

A Python virtual environment has been successfully created at:
```
venv/
```

## Activation Instructions

### For MSYS64/Git Bash:
```bash
source venv/bin/activate
```

### For Command Prompt (Windows):
```cmd
venv\Scripts\activate.bat
```

### For PowerShell:
```powershell
venv\Scripts\Activate.ps1
```

## Required Dependencies

The following packages need to be installed from `requirements.txt`:

### Core ML Dependencies
- numpy >= 1.21.0
- scipy >= 1.7.0
- torch >= 1.12.0
- torchvision >= 0.13.0

### Testing
- pytest >= 7.0.0
- pytest-asyncio >= 0.21.0
- pytest-mock >= 3.10.0
- pytest-benchmark >= 4.0.0
- httpx >= 0.24.0
- pydantic-settings >= 2.0.0

### API & Web
- fastapi >= 0.95.0
- uvicorn >= 0.20.0
- websockets >= 10.4
- pydantic >= 1.10.0
- python-jose[cryptography] >= 3.3.0
- python-multipart >= 0.0.6
- passlib[bcrypt] >= 1.7.4

### Database
- sqlalchemy >= 2.0.0
- asyncpg >= 0.28.0
- aiosqlite >= 0.19.0
- redis >= 4.5.0

### CLI & Utilities
- click >= 8.0.0
- alembic >= 1.10.0
- asyncio-mqtt >= 0.11.0
- aiohttp >= 3.8.0
- paramiko >= 3.0.0

### Data Processing
- opencv-python >= 4.7.0
- scikit-learn >= 1.2.0

###  Monitoring
- prometheus-client >= 0.16.0

### Development Tools
- black >= 23.0.0
- flake8 >= 6.0.0
- mypy >= 1.0.0

## Installation on Windows/MSYS64

Due to compilation requirements on Windows, follow this approach:

### Option 1: Install All at Once (Recommended)
```bash
source venv/bin/activate
pip install -r requirements.txt --prefer-binary
```

### Option 2: Install in Groups
```bash
source venv/bin/activate

# Group 1: Testing tools
pip install pytest pytest-asyncio pytest-mock pytest-benchmark httpx pydantic-settings

# Group 2: API framework
pip install fastapi uvicorn websockets pydantic python-jose python-multipart passlib

# Group 3: Database & async
pip install sqlalchemy asyncpg aiosqlite redis

# Group 4: CLI & utilities
pip install click alembic asyncio-mqtt aiohttp paramiko

# Group 5: Data processing
pip install opencv-python scikit-learn

# Group 6: Development tools
pip install black flake8 mypy prometheus-client

# Group 7: Core ML (may take time to compile)
pip install numpy scipy
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu121
```

### Option 3: Skip Optional Packages First
If compilation is slow, install without source packages:
```bash
pip install --only-binary=:all: -r requirements.txt
```

## Verification

Once installation completes, verify the environment:

```bash
source venv/bin/activate
python -c "import sys; print(f'Python {sys.version}')"
pip list
```

## Troubleshooting

### Issue: Build failure on pydantic-core, asyncpg, or numpy
**Solution:** These require compilation on Windows
```bash
# Use pre-built wheels only
pip install --only-binary=:all: pydantic asyncpg numpy
```

### Issue: Missing C compiler
**Solution:** On MSYS64, ensure you have build tools:
```bash
pacman -S base-devel mingw-w64-x86_64-toolchain
```

### Issue: MSYS2 environment conflicts
**Solution:** Use Windows native Python interpreter or ensure MSYSTEM is unset:
```bash
unset MSYSTEM
source venv/bin/activate
pip install -r requirements.txt
```

## Environment Variables

Create a `.env` file in the root directory (template provided as `example.env`):

```bash
cp example.env .env
# Edit .env with your configuration
```

## Next Steps

1. ✓ Virtual environment created
2. ⏳ Install requirements (see options above)
3. Verify installation
4. Run tests: `pytest tests/`
5. Start development server: `python -m uvicorn wifi_densepose.api.main:app --reload`

