@echo off
setlocal

call "%VS140COMNTOOLS%\..\..\vc\vcvarsall.bat" x86

pushd protobuf\cmake\build\release
nmake

exit /b %ERRORLEVEL%
