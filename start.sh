#!/bin/bash
# RuView API Server Starter
# Sets correct PYTHONPATH and runs uvicorn without reload issues

source venv/bin/activate

# Change to v1 directory (where src/ is located)
cd v1

# Run uvicorn with src on PYTHONPATH
# --no-reload avoids multiprocessing issues on Windows
python.exe -m uvicorn api.main:app --host 0.0.0.0 --port 8000 --no-reload

