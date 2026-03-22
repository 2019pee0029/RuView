@echo off
REM RuView API Server Starter
REM Sets correct PYTHONPATH and runs uvicorn without reload issues

call venv\Scripts\activate.bat

REM Change to v1 directory (where src/ is located)
cd v1

REM Run uvicorn from the v1 directory
REM --no-reload avoids multiprocessing issues on Windows
python.exe -m uvicorn api.main:app --host 0.0.0.0 --port 8000 --no-reload

pause
