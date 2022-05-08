$venvDir = "venv"
$reqMajor = 3
$reqMinor = 7

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

function Get-ExpectedPythonCmd() {
    if (Test-IfCmdIsRequiredPythonVer "python") { return "python" }
    elseif (Test-IfCmdIsRequiredPythonVer "python3 ") { return "python3" }
    else { return "" };
}

function Test-IfRunningInsideVenv() {
    $pythonCmd = (Get-ExpectedPythonCmd)
    if ($pythonCmd -eq "") {
        Write-Output "No valid Python version found. Version $reqMajor.$reqMinor is required at minimum.";
        return $false;
    }

    Invoke-Expression "$pythonCmd -c ""import sys; sys.exit(0 if sys.prefix != sys.base_prefix else 2)"""

    return $res -eq 0;
}

function Test-IfVenvDirIsPresent() {
    return test-path -path $venvDir;
}

function Enable-Venv() {
    Invoke-Expression "& $venvDir\Scripts\activate"
    Write-Output "NOTE: You are now running in a Python virtualenv"
}