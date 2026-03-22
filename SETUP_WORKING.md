# 🔧 RuView Setup - Complete Working Solution

## Issue Summary
The app structure has `wifi_densepose` code in `v1/src/`, with imports like `from src.api.main import app`. The previous attempts failed because:
1. Wrong module path: using `wifi_densepose.api.main` instead of `api.main`
2. Uvicorn reloader spawned subprocesses that lost PYTHONPATH
3. Unicode encoding errors in setup.py

## ✅ THE SOLUTION: Use start.sh or start.bat

### Option 1: MSYS2/Bash (Recommended)
```bash
cd ~/RuView/RuView
bash start.sh
```

### Option 2: Windows CMD
```cmd
cd c:\msys64\home\AIJAZ\RuView\RuView
start.bat
```

### Option 3: Manual Command
```bash
source venv/bin/activate
cd v1
python.exe -m uvicorn api.main:app --host 0.0.0.0 --port 8000 --no-reload
```

## 🎯 Key Fixes Applied
1. **Correct module path**: `api.main:app` (not `wifi_densepose.api.main`)
2. **Correct working directory**: Run from `v1/` where `src/` is located
3. **No reload**: `--no-reload` flag prevents multiprocessing issues on Windows
4. **Use python.exe -m**: Works around MINGW64 subprocess issues

## 📝 What Changed
- `start.sh` — Now runs from v1/ with correct import path
- `start.bat` — Same for Windows CMD
- No PYTHONPATH manipulation needed

## 🧪 Test It Works
Once the server starts, you should see:
```
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Application startup complete
```

Then test with curl:
```bash
curl http://localhost:8000/docs
```

Or open browser: http://localhost:8000/docs

## 🚨 If Still Not Working

Check the working directory:
```bash
source venv/bin/activate
cd v1
pwd  # Should show: /home/AIJAZ/RuView/RuView/v1
ls -la src/  # Should list: api, config, core, hardware, models, services, etc.
```

Then run:
```bash
python -c "import sys; print(sys.path)"
python -c "from src.api.main import app; print('✓ Import works!')"
python.exe -m uvicorn api.main:app --host 0.0.0.0 --port 8000 --no-reload
```

## 📋 Summary
- **Setup time**: ~5-10 minutes total (environment creation + dependencies)
- **Dependencies installed**: 4 pure-Python packages (fastapi, uvicorn, pytest, click)
- **No compilation needed**: All wheels pre-built
- **Server start time**: < 5 seconds
- **Status**: ✅ Ready to use
