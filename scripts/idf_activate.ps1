function global:idf_exit () {
    deactivate
    Remove-Item -Path Function:idf_exit
    Remove-Item -Path Function:_idf_py_exec
    Remove-Item -Path Alias:idf.py
}

function global:_idf_py_exec {
    python $env:IDF_PATH/tools/idf.py
}

# Activate esp-idf-pyenv first
. $env:IDF_PYTHON_ENV_PATH/Scripts/Activate.ps1
. $env:IDF_PATH/export.ps1
python $env:IDF_PATH/tools/idf_tools.py export --prefer-system

New-Alias -Force -Name idf.py -Value _idf_py_exec -Scope Global
