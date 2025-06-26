$ErrorActionPreference = "Stop"

if( -not (Test-Path -Path ".venv")) {
    Write-Host "Creating virtual environment..."
    python -m venv .venv
    .venv\Scripts\pip install --upgrade pip
    .venv\Scripts\pip install requests
} else {
    Write-Host "Virtual environment already exists. Skipping creation."
}
