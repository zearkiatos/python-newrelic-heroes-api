function Activate {
    if (Test-Path "venv") {
        Write-Host "Python environment was activated"
        . .\venv\Scripts\Activate.ps1
    } else {
        Write-Host "The folder environment doesn't exist"
        python -m venv venv
        . .\venv\Scripts\Activate.ps1
        Write-Host "The environment folder was created and the python environment was activated"
    }
}

function Install {
    pip install -r requirements.txt
}

function Run {
    param(
        [int]$Port
    )

    $env:FLASK_APP = "src.application:application"

    if ($Port) {
        flask run -p $Port
    } else {
        flask run
    }
}
