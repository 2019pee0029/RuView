## RuView — Basic Functionality Quick Start

### 🚀 Step 1: Create & Activate Virtual Environment

```bash
cd ~/RuView/RuView

# Create fresh environment
rm -rf venv
python -m venv venv

# Activate (choose one)
source venv/bin/activate           # MSYS2/Bash
# OR
venv\Scripts\activate.bat          # Windows CMD
```

---

### 📦 Step 2: Install Minimal Core Dependencies (**Zero Compilation**)

**Option A: Use the quickstart script (recommended)**

```bash
bash quickstart.sh          # MSYS2
# OR
quickstart.bat              # Windows CMD
```

**Option B: Manual install**

```bash
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements-minimal.txt
```

**What gets installed:**
- `fastapi==0.95.0` — Web framework
- `uvicorn==0.20.0` — ASGI server
- `pytest==7.0.0` — Testing framework
- `click==8.0.0` — CLI utilities

**Time**: ~30 seconds (4 packages, **zero compilation**)

**Why so minimal?** Most other packages in Python depend on cryptography, which requires Rust to compile on MINGW64. This 4-package set is the absolute minimum needed to run a working API server.

---

### ✅ Step 3: Verify Installation

```bash
python -c "import fastapi; import pytest; print('✓ Core dependencies ready')"
```

**Expected output:**
```
✓ Core dependencies ready
```

---

### 🎯 Step 4: Run the API Server (Core Functionality)

```bash
# Activate venv if not already
source venv/bin/activate

# Run the sensing server
uvicorn wifi_densepose.api.main:app --reload --host 0.0.0.0 --port 8000
```

**Expected output:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000
INFO:     Application startup complete
```

**Then test with curl:**
```bash
# In another terminal
curl http://localhost:8000/health

# Expected response:
# {"status": "healthy", "version": "0.3.0"}
```

---

### 🌐 Step 5: Open the Web UI (Optional)

Navigate to:
- **API Docs**: http://localhost:8000/docs (FastAPI Swagger UI)
- **Health Check**: http://localhost:8000/health

---

### 📊 Step 6: Test with Simulated Data (No Hardware Required)

```bash
# The API runs in simulated mode by default
# Test an endpoint
curl http://localhost:8000/api/v1/presence

# Alternatively, use the OpenAPI docs at:
# http://localhost:8000/docs
```

---

### 🧪 Step 7: Run Tests

```bash
source venv/bin/activate

# Run core tests
pytest tests/ -v --tb=short

# Run specific test module
pytest tests/test_api.py -v
```

---

### 📚 Step 8: Add Optional Packages Later (When Needed)

Once the minimal 4-package setup works, you can optionally add more:

**Pure-Python packages (no compilation needed):**
```bash
pip install websockets              # WebSocket support
pip install pyyaml                 # YAML config files
```

**Packages that need build tools (or use pre-built wheels):**
```bash
# These may require compilation on MINGW64
# Option 1: Install build tools first (gfortran, openblas)
pacman -S mingw-w64-x86_64-openblas mingw-w64-x86_64-gcc-fortran

# Then install
pip install numpy scipy scikit-learn

# Option 2: Use CPU-only PyTorch (smaller, has wheels)
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu

# Option 3: Skip these packages entirely and use Docker instead
```

**Don't worry about these yet** — they're only needed for ML/signal processing features, not for basic API functionality.

---

## 📋 Available Endpoints (Simulated Mode)

When the server runs without hardware, it provides these endpoints:

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Redirect to UI |
| `/health` | GET | System health status |
| `/api/v1/csi/stream` | GET (WebSocket) | Stream simulated CSI frames |
| `/api/v1/pose/current` | GET | Current pose skeleton (simulated) |
| `/api/v1/vitals/breathing` | GET | Breathing rate (simulated) |
| `/api/v1/vitals/heartrate` | GET | Heart rate (simulated) |
| `/api/v1/presence` | GET | Presence detection (simulated) |

**Example:**
```bash
curl http://localhost:8000/api/v1/pose/current
```

---

## 🔧 Environment Variables

Create `.env` file (or use defaults):

```bash
# Copy template
cp example.env .env

# Edit with your settings (optional for basic mode)
# DEFAULT VALUES WORK FOR BASIC TESTING
```

---

##  🐳 Alternative: Run with Docker (Easiest)

If you want to avoid Python setup entirely:

```bash
docker pull ruvnet/wifi-densepose:latest
docker run -p 3000:3000 -p 8000:8000 ruvnet/wifi-densepose:latest
```

Then open http://localhost:3000

---

## 🛑 Troubleshooting

### Issue: `error: subprocess-exited-with-error` on cryptography or paramiko

**Cause:** These packages require Rust compilation on MINGW64 and don't have pre-built wheels.

**Fix:** Use the minimal requirements that skip all packages requiring compilation:
```bash
pip install -r requirements-minimal.txt
```

Or run the fixed quickstart script:
```bash
bash quickstart.sh  # MSYS2
# OR
quickstart.bat      # Windows CMD
```

### Issue: `ModuleNotFoundError: No module named 'wifi_densepose'`

**Fix:**
```bash
# Make sure you're in the right directory
cd ~/RuView/RuView

# Activate venv
source venv/bin/activate

# Install in development mode
pip install -e .
```

### Issue: Port 8000 already in use

**Fix:**
```bash
# Use a different port
uvicorn wifi_densepose.api.main:app --port 8001
```

### Issue: `Cannot find uvicorn` or other dependency

**Fix:**
```bash
source venv/bin/activate
pip install -r requirements-minimal.txt
```

### Issue: `pydantic-core` compilation fails

**Fix:** Skip pydantic entirely for now and use the minimal requirements:
```bash
pip install -r requirements-minimal.txt
```

The minimal setup has everything needed to run the API server and test basic functionality.

---

## 📝 Next Steps

1. **Basic API works?** → Explore endpoints with curl or Postman
2. **Want ML features?** → Install optional packages later:
   ```bash
   pacman -S mingw-w64-x86_64-openblas
   pip install --prefer-binary numpy scipy scikit-learn
   ```
3. **Have ESP32 hardware?** → See [Hardware Setup](docs/user-guide.md#hardware-setup)
4. **Want to train models?** → See [Training Guide](docs/user-guide.md#training-a-model)

---

## 🎓 Understanding the Minimal Setup

With **4 packages only** (fastapi, uvicorn, pytest, click), you have:

- ✅ **REST API** — Create simple API endpoints with FastAPI
- ✅ **Server** — Run the Uvicorn ASGI server
- ✅ **Testing** — Use pytest for unit tests
- ✅ **CLI** — Build command-line tools with Click

**What's NOT available (requires additional packages that need compilation):**
- ❌ WebSocket streaming (needs websockets)
- ❌ HTTPS/TLS (needs cryptography → requires Rust)
- ❌ SSH/Paramiko (needs cryptography → requires Rust)
- ❌ Async HTTP (needs aiohttp and dependencies)
- ❌ Database ORM (needs sqlalchemy with async drivers)
- ❌ ML/Signal processing (needs numpy, scipy, torch)
- ❌ Real WiFi sensing (needs signal processing packages)

**This is intentional!** We're avoiding the Rust compilation issue entirely by using only pure-Python packages.

---

## 🚀 Growing Beyond Minimal

Once the minimal setup works, you can add packages progressively:

1. **First**, verify the API server runs: `uvicorn wifi_densepose.api.main:app`
2. **Then**, add websockets: `pip install websockets` (pure Python)
3. **Then**, add data processing: Install `numpy`, `scipy` (may need build tools first)
4. **Finally**, add ML: Install `torch`, `torchvision`

Each addition is opt-in based on what features you need.

---

**Total setup time: ~1 minute**  
**Disk space: ~50 MB** (just 4 packages)  
**Compilation required: None** (pure Python only)  
**Hardware required: None**
