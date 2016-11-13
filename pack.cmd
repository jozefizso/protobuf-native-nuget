@echo off
setlocal

nuget pack protobuf-native.nuspec -OutputDirectory artifacts
exit /b %ERRORLEVEL%
