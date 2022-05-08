Set-Location $PSScriptRoot 
# echo $PSCommandPath    

$reqMajor = 3
$reqMinor = 7
$venvDir = "venv"

function Test-IfCmdIsRequiredPythonVer([string] $cmdName) {
    try {
        $cmd = (get-command $cmdName)
        if (($cmd.Version.Major -lt $reqMajor) -or ( $cmd.Version.Minor -lt $reqMnor)) {
            return $false
        } 
        return $true
    }
    catch {
        return $false
    }
}

$python = if (Test-IfCmdIsRequiredPythonVer "python") { "python" }
elseif (Test-IfCmdIsRequiredPythonVer "python3 ") { "python3" }
else { "" };

$python = "python3"

if ($python -eq "") {
    Write-Output "Required Python version not found!"
    Write-Output "You need to have at least python ver $reqMajor.$reqMinor to run this application."
    Exit 10
}

if (!(test-path -path $venvDir)) {
    Invoke-Expression "$python -m venv $venvDir"
}

# Invoke-Expression "$python -c ""import sys; sys.exit(0 if sys.prefix == sys.base_prefix else 2)"""
# $res=$?

Invoke-Expression "& $venvDir\Scripts\activate"

pip install -r ".\requirements.txt"

Write-Output "Note! You are now running in a python virtualenv"


