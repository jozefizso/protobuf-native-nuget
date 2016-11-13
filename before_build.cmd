@echo off
setlocal

call "%VS140COMNTOOLS%\..\..\vc\vcvarsall.bat" x86

if not exist artifacts mkdir artifacts
if not exist protobuf-install\release mkdir protobuf-install\release
if not exist protobuf-install\debug mkdir protobuf-install\debug

pushd protobuf\cmake

if not exist build mkdir build
cd build

if not exist release mkdir release
pushd release

cmake -G "NMake Makefiles" ^
 -DCMAKE_BUILD_TYPE=Release ^
 -DCMAKE_INSTALL_PREFIX=../../../../protobuf-install/release ^
 -Dprotobuf_BUILD_TESTS=OFF ^
 -Wno-dev ^
 ../..

popd

if not exist debug mkdir debug
pushd debug

cmake -G "NMake Makefiles" ^
 -DCMAKE_BUILD_TYPE=Debug ^
 -DCMAKE_INSTALL_PREFIX=../../../../protobuf-install/debug ^
 -Dprotobuf_BUILD_TESTS=OFF ^
 -Wno-dev ^
 ../..

exit /b %ERRORLEVEL%
