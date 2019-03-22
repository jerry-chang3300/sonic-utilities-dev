set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.

set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

for /f %%i in ('scripts\ini.bat /i ENV_HOME .env') do set ENV_HOME=%%i

mkdir %ENV_HOME%

pushd .
cd %ENV_HOME%
set ENV_HOME=%cd%
popd

Powershell.exe -ExecutionPolicy Bypass -Command "(New-Object Net.WebClient).DownloadFile('https://dist.nuget.org/win-x86-commandline/latest/nuget.exe', '%ENV_HOME%\nuget.exe');"

%ENV_HOME%\nuget.exe install python2 -DirectDownload -ExcludeVersion -OutputDirectory %ENV_HOME%
set PATH=%ENV_HOME%\python2\tools;%ENV_HOME%\python2\tools\Scripts;%PATH%

@REM Fatal error in launcher: Unable to create process using '"c:\build27\cpython\tools\nuget\obj_amd64\python.exe"  "E:\python2\tools\Scripts\pip.exe" --version'
python -m pip install --upgrade --force-reinstall pip

@REM @rem Find git.exe
@REM
@REM set GIT_EXE=git.exe
@REM %GIT_EXE% --version >NUL 2>&1 && (
@REM     goto findGit
@REM ) || (
@REM     echo not found git
@REM )
@REM
@REM %ENV_HOME%\nuget.exe install Git-Windows-Minimal -DirectDownload -ExcludeVersion -OutputDirectory %ENV_HOME%
@REM set PATH=%ENV_HOME%\Git-Windows-Minimal\tools\mingw64\bin;%PATH%
@REM
@REM :findGit
