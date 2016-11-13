@echo off
setlocal

call "%VS140COMNTOOLS%\..\..\vc\vcvarsall.bat" x86

pushd protobuf\cmake\build\release
nmake install
popd


pushd protobuf\cmake\build\debug
nmake install
popd

exit /b %ERRORLEVEL%
