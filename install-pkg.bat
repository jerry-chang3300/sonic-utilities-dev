set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.

@rem Find pip.exe
set PIP_EXE=pip.exe
%PIP_EXE% --version >NUL 2>&1 && (
    goto findPip
) || (
    echo not found pip
)

:findPip

pip install -r requirements.txt

git submodule init
git submodule update

pushd .
cd sonic-buildimage\src\sonic-config-engine
python setup.py build
python setup.py install
popd

pushd .
cd sonic-py-swsssdk
python setup.py build
python setup.py install
popd

@rem for openconfig_acl
set PYTHONPATH=%cd%\tests;%cd%\sonic-buildimage\src\sonic-config-engine
