pushd "%GBC%\net\%LNCH%\%NEOPKT%"
"%GBC%\fart.exe" "%MEDN%*.cfg" [MEDN] "%GBE%\%EMUZ%\%MEDN%"
popd

for /d %%g IN (*) DO (
if "%RECONF%"=="1" copy /Y "%GBC%\net\%LNCH%\%NEOPKT%\%MEDN%*.cfg" "%%~g"
  set CSTM=%%~g
  pushd "%%~g"
  call :injext
CALL "%GBC%\Neopktinject.bat"
popd
  )
  exit /b
:injext
call "%GBC%\CreateGamSubDir.bat"
  for /f "tokens=* delims= " %%a in ('dir /b/a-d-h') do (
if /I "%%~xa"==".zip" "%GBC%\fart.exe" "*.bat" [EXT] zip
if /I "%%~xa"==".ngp" "%GBC%\fart.exe" "*.bat" [EXT] ngp
if /I "%%~xa"==".npk" "%GBC%\fart.exe" "*.bat" [EXT] npk
if /I "%%~xa"==".ngc" "%GBC%\fart.exe" "*.bat" [EXT] ngc
if /I "%%~xa"==".neo" "%GBC%\fart.exe" "*.bat" [EXT] neo
)
:skp