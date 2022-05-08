Set-Location $PSScriptRoot 

. ./scripts/pythonHelpers.ps1

if (-not (Test-IfVenvDirIsPresent)) {
    "No venv present. Run installApps.ps1 first or setup the virtualenv in the ""\.venv\"" directory."
    Exit 2
}
if (-not (Test-IfRunningInsideVenv)) {
    Enable-Venv
}

uvicorn car_seller.main:app --reload