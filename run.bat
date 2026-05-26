@echo off

:activate
if exist venv (
    echo Python environment was activated
    call venv\Scripts\activate.bat
) else (
    echo The folder environment doesn't exist
    python -m venv venv
    call venv\Scripts\activate.bat
    echo The environment folder was created and the python environment was activated
)
exit /b 0

:install
pip install -r requirements.txt
exit /b 0

:run
set FLASK_APP=src.application:application
if "%~1"=="" (
    flask run
) else (
    flask run -p %1
)
exit /b 0

:docker-local-up
docker compose -f docker-compose.local.yml up -d --build
exit /b 0

:docker-local-down
docker compose -f docker-compose.local.yml down
exit /b 0

:podman-local-up
podman compose -f docker-compose.local.yml up -d --build
exit /b 0

:podman-local-down
podman compose -f docker-compose.local.yml down
exit /b 0