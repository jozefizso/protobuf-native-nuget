@setlocal
@setlocal EnableDelayedExpansion

set _build=1
@IF NOT "%APPVEYOR_BUILD_NUMBER%"=="" (
  set _build=%APPVEYOR_BUILD_NUMBER%
)

set _version=3.0.0-preview%_build%

nuget pack protobuf-native.nuspec -OutputDirectory artifacts -Version %_version% -NonInteractive
exit /b %ERRORLEVEL%
